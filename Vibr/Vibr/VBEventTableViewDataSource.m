//
//  VBEventTableViewDataSource.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBEventTableViewDataSource.h"
#import "VBEvent.h"
#import "VBEventTableViewCell.h"
#import "VBArtist.h"

@implementation VBEventTableViewDataSource

- (instancetype)initWithEvent:(VBEvent *)event
{
  if (self = [super init]) {
    self.event = event;
  }
  return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 80.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 44.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return self.event.artist.displayName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  VBEventTableViewCell *cell = (VBEventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"eventTableViewCell"];
  cell.event = self.event;
  cell.cellType = (eEventCellType)indexPath.row;
  
  
  return cell;
}

@end
