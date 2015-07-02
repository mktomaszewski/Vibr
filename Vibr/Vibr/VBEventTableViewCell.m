//
//  VBEventTableViewCell.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBEventTableViewCell.h"
#import "VBVenue.h"

@implementation VBEventTableViewCell


- (void)setCellType:(eEventCellType)cellType
{
  _cellType = cellType;
  [self mapModelToView];
}

- (void)mapModelToView
{
  switch (self.cellType) {
    case eCellTypeEventDescription:
      [self.imageView setImage:[UIImage imageNamed:@"EventType"]];
      self.titleLabel.text = self.event.eventType;
      break;
      case eCellTypeEventAddress:
      
      [self.imageView setImage:[UIImage imageNamed:@"Location"]];
      self.titleLabel.text = self.event.venue.displayName;
      
      break;
      
    case eCellTypeEventDate:
      
      [self.imageView setImage:[UIImage imageNamed:@"DateTime"]];
      self.titleLabel.text = self.event.startDate;
      
      break;
      
    default:
      break;
  }
}

@end
