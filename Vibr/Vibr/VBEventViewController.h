//
//  VBEventViewController.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VBEvent;

@interface VBEventViewController : UIViewController

@property (nonatomic, strong)VBEvent *event;

- (instancetype)initWithEvent:(VBEvent *)event;

@end
