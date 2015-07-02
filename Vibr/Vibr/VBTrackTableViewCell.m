
//
//  KDTrackTableViewCell.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBTrackTableViewCell.h"
#import "VBTrack.h"

@import AVFoundation;

@interface VBTrackTableViewCell()

@property (nonatomic, strong) AVPlayer *player;

@end
@implementation VBTrackTableViewCell


- (IBAction)playAction:(id)sender
{
  [self.playButton setSelected:!self.playButton.selected];
  if (self.player) {
    [self.player pause];
    [self.player removeObserver:self forKeyPath:@"status"];
    self.player = nil;
  }
  else {
    NSURL *soundFileURL = [NSURL URLWithString:self.track.audioUrlString];
    self.player = [[AVPlayer alloc] initWithURL:soundFileURL];
    [self.player addObserver:self forKeyPath:@"status" options:0 context:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"actionPlay" object:self.player];
  }
}

- (void)awakeFromNib
{
  [[NSNotificationCenter defaultCenter] addObserverForName:@"actionPlay" object:nil queue:nil usingBlock:^(NSNotification *note) {
    AVPlayer *player = (AVPlayer *)note.object;
    
    if (self.player != player) {
      [self.player pause];
      [self.player removeObserver:self forKeyPath:@"status"];
      self.player = nil;
      [self.playButton setSelected:NO];
    }
   }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  
  if (object == self.player && [keyPath isEqualToString:@"status"]) {
    if (self.player.status == AVPlayerStatusFailed) {
      NSLog(@"AVPlayer Failed");
      
    } else if (self.player.status == AVPlayerStatusReadyToPlay) {
      NSLog(@"AVPlayerStatusReadyToPlay");
      [self.player play];
      
      
    } else if (self.player.status == AVPlayerItemStatusUnknown) {
      NSLog(@"AVPlayer Unknown");
      
    }
  }
}


- (void)setTrack:(VBTrack *)track
{
  _track = track;
  [self mapModelToView];
}

- (void)mapModelToView
{
  self.songNameLabel.text = self.track.displayName;
}

@end
