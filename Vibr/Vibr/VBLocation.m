
//
//  VBLocation.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBLocation.h"

@implementation VBLocation

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
  if (self = [super init]) {
    self.location = [[CLLocation alloc] initWithLatitude:[attributes[@"lat"] doubleValue]
                                               longitude:[attributes[@"lng"] doubleValue]];
    
    self.cityName = attributes[@"city"];
  }
  return self;
}
@end
