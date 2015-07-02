//
//  VBVenue.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface VBVenue : NSObject


@property (nonatomic, strong)NSString *displayName;
@property (nonatomic, strong)CLLocation *location;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
