//
//  VBEventTableViewDataSource.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@class VBEvent;

@interface VBEventTableViewDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic)VBEvent *event;

- (instancetype)initWithEvent:(VBEvent *)event;

@end
