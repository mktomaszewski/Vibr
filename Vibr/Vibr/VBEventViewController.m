//
//  VBEventViewController.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//
#import "VBEvent.h"
#import "VBEventViewController.h"

#import "VBTracksDataSource.h"
#import "VBEventTableViewDataSource.h"

#import "VBArtist.h"

#import "UIImageView+AFNetworking.h"

@interface VBEventViewController()


@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *artistImageView;
@property (weak, nonatomic) IBOutlet UITableView *songsTableView;
@property (weak, nonatomic) IBOutlet UITableView *venueTableView;
@property (weak, nonatomic) IBOutlet UIButton *buyTicketButton;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

@property (strong, nonatomic)VBTracksDataSource *tracksDataSource;
@property (strong, nonatomic)VBEventTableViewDataSource *eventDataSource;


@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurBackgroundView;

@end

@implementation VBEventViewController

- (IBAction)buyTicketAction:(id)sender
{
  [[UIApplication sharedApplication] openURL:self.event.ticketURL];
  
}

- (instancetype)initWithEvent:(VBEvent *)event
{
  if (self = [super init]) {
    self.event = event;
  }
  return self;
  
}


- (void)setEvent:(VBEvent *)event
{
  _event = event;
  [self mapModelToView];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.navigationController setNavigationBarHidden:YES];
  
  self.tracksDataSource = [[VBTracksDataSource alloc] initWithTracksArray:self.event.artist.tracksArray];
  self.songsTableView.dataSource  = self.tracksDataSource;
  self.songsTableView.delegate    = self.tracksDataSource;
  
  self.eventDataSource = [[VBEventTableViewDataSource alloc] initWithEvent:self.event];
  self.venueTableView.dataSource  = self.eventDataSource;
  self.venueTableView.delegate    = self.eventDataSource;
  
  if (self.event) {
    [self mapModelToView];
  }
}


- (void)mapModelToView
{
  self.artistNameLabel.text = self.event.artist.displayName;
  
  __weak __typeof__(self) weakSelf = self;
  NSURLRequest *artistImageRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[self.event.artist.imagesArray firstObject]]];
  [self.artistImageView setImageWithURLRequest:artistImageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
    
    [weakSelf.artistImageView setImage:image];
    
    [UIView animateWithDuration:0.2 animations:^{
      weakSelf.artistImageView.alpha = 1.0f;
    }];
  } failure:nil];
  
  
  [self.backgroundImageView setImageWithURLRequest:artistImageRequest placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
    
    [weakSelf.backgroundImageView setImage:image];
    weakSelf.blurBackgroundView.alpha = 1.0f;
    [UIView animateWithDuration:0.2 animations:^{
      weakSelf.backgroundImageView.alpha = 1.0f;

    }];
  } failure:nil];
  
  [self.songsTableView reloadData];
  [self.venueTableView reloadData];
  
}

@end
