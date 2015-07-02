//
//  VBLocation.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;


@interface VBLocation : NSObject

@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSString *cityName;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
