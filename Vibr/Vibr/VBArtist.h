//
//  VBArtist.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBArtist : NSObject

@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *displayName;

@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic, strong) NSArray *tracksArray;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;


@end
