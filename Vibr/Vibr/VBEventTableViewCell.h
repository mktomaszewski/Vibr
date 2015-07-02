//
//  VBEventTableViewCell.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBEvent.h"

typedef enum {
  eCellTypeEventDescription = 0,
  eCellTypeEventAddress = 1,
  eCellTypeEventDate = 2
} eEventCellType;


@interface VBEventTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (nonatomic) eEventCellType cellType;
@property (nonatomic, strong) VBEvent *event;

@end
