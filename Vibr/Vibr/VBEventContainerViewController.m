//
//  VBEventViewController.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBEventContainerViewController.h"
#import "VBEventViewController.h"
#import "VBEvent.h"
#import "VBEventViewController.h"

@interface VBEventContainerViewController()

@property (nonatomic, strong)VBEvent *currentEvent;


@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic)VBEventViewController *currentEventViewController;

@end

@implementation VBEventContainerViewController



- (void)viewDidLoad
{
  [super viewDidLoad];
  

//  [self reloadData];
  
  
}

- (void)switchEvent
{
  NSUInteger currentIndex = [self.eventsArray indexOfObject:self.currentEvent];
  
  if (currentIndex == self.eventsArray.count-1) {
    [self reloadData];
  }
  else {
    self.currentEvent = self.eventsArray[currentIndex+1];
  }
}

- (void)reloadData
{
  __weak __typeof__(self) weakSelf = self;
  [VBEvent eventsWithBlock:^(NSArray *eventsArray, NSError *error) {
    weakSelf.eventsArray = eventsArray;
  }];
}

- (void)setCurrentEventViewController:(VBEventViewController *)currentEventViewController
{
  
  if (!_currentEventViewController) {
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:currentEventViewController];
    [self addChildViewController:navController];
    [self.view addSubview:navController.view];
  }
  else {
    [_currentEventViewController.navigationController pushViewController:currentEventViewController animated:YES];
  }
  
  
  _currentEventViewController = currentEventViewController;
  
  
}
- (void)setEventsArray:(NSArray *)eventsArray
{
  _eventsArray = eventsArray;
  self.currentEvent = [eventsArray firstObject];
}

- (void)setCurrentEvent:(VBEvent *)currentEvent
{
  _currentEvent = currentEvent;
  
  VBEventViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EventViewController"];
  vc.event = currentEvent;
  self.currentEventViewController = vc;
  
  
  [self mapModelToView];
}

- (void)mapModelToView
{
  self.descriptionLabel.text = self.currentEvent.description;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  if (motion == UIEventSubtypeMotionShake)
  {
    // User was shaking the device. Post a notification named "shake."
    [self switchEvent];
  }
}


@end
