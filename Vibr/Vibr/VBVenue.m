//
//  VBVenue.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBVenue.h"

@implementation VBVenue

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
  if (self = [super init]) {
    
    id lat = attributes[@"lat"];
    id lng = attributes[@"lng"];
    
              if (lat && lng) {
      self.location = [[CLLocation alloc] initWithLatitude:[lat doubleValue]
                                                 longitude:[lng doubleValue]];
              }
    
    self.displayName = attributes[@"displayName"];
  }
  return self;

  
}

@end
