//
//  VBLoginViewController.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBLoginViewController.h"
#import <Spotify/Spotify.h>
#import "VBEventContainerViewController.h"
#import "VBEvent.h"

@import MediaPlayer;
@import AVKit;
@import AVFoundation;

@interface VBLoginViewController()

@property (weak, nonatomic) IBOutlet UIView *videoView;

@property (strong, nonatomic) AVPlayer *player;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation VBLoginViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
  __weak __typeof__(self) weakSelf = self;
  
  self.loginViewCenterYConstraint.constant = self.view.frame.size.height;
  [self.view layoutIfNeeded];
  
  
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"urlHandled" object:nil queue:nil usingBlock:^(NSNotification *note) {
    
    self.loginView.hidden = YES;
    self.activityIndicator.hidden = NO;
    
    
  }];
  
  
  [[NSNotificationCenter defaultCenter] addObserverForName:@"authSuccess" object:nil queue:nil usingBlock:^(NSNotification *note) {
    
    
    
    [weakSelf loadData];
  }];
  

 
  
  [self prepareVideo];
  
  self.loginViewCenterYConstraint.constant = 0.0f;
  [UIView animateWithDuration:0.3 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    [weakSelf.view layoutIfNeeded];
    weakSelf.visualEffectView.alpha = 1.0f;
  } completion:nil];
}


- (void)loadData
{
  __weak __typeof__(self) weakSelf = self;
  

  
  
  [VBEvent eventsWithBlock:^(NSArray *eventsArray, NSError *error) {
    
    VBEventContainerViewController *controller = [weakSelf.storyboard instantiateViewControllerWithIdentifier:@"EventContainerViewController"];
    
    [controller setEventsArray:eventsArray];
    
    [weakSelf presentViewController:controller animated:YES completion:nil];
    
  }];
  

}


- (void)prepareVideo
{
  AVURLAsset * asset = [AVURLAsset URLAssetWithURL:[NSURL fileURLWithPath: [[NSBundle mainBundle]
                                                                            pathForResource:@"Party" ofType:@"mp4"]] options:nil];

  // Create a player item
  AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
//  [playerItem setAudioMix:audioZeroMix]; // Mute the player item
  
  // Create a new Player, and set the player to use the player item
  // with the muted audio mix
  self.player = [AVPlayer playerWithPlayerItem:playerItem];
  
  [self.player play];
  
  AVPlayerLayer* playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
  playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
  
  CGRect videoRect = CGRectZero;
  
 
  videoRect.size =  self.view.bounds.size;
  
  
  playerLayer.frame = videoRect;
  
  self.player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(playAgain)
                                               name:AVPlayerItemDidPlayToEndTimeNotification
                                             object:[self.player currentItem]];
  
  [self.videoView.layer addSublayer:playerLayer];
  

}

- (void)playAgain
{
  [self.player.currentItem seekToTime:kCMTimeZero];
}

- (IBAction)loginAction:(id)sender
{
  [self login];
}

- (void)login
{
    [[UIApplication sharedApplication] openURL:[SPTAuth defaultInstance].loginURL];
}

@end
