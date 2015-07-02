//
//  VBTracksDataSource.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface VBTracksDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)NSArray *tracksArray;

- (instancetype)initWithTracksArray:(NSArray *)tracksArray;


@end
