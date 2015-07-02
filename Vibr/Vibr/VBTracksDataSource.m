//
//  VBTracksDataSource.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBTracksDataSource.h"
#import "VBTrackTableViewCell.h"

@implementation VBTracksDataSource

- (instancetype)initWithTracksArray:(NSArray *)tracksArray
{
  if (self = [super init]) {
    self.tracksArray = tracksArray;
  }
  return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.tracksArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  VBTrackTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trackTableViewCell"];
  
  cell.track = self.tracksArray[indexPath.row];
  
  return cell;
}

@end
