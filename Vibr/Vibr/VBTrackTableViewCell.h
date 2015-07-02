//
//  KDTrackTableViewCell.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VBTrack;

@interface VBTrackTableViewCell : UITableViewCell

@property (nonatomic, strong)VBTrack *track;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end
