//
//  VBArtist.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBArtist.h"
#import "VBTrack.h"

@implementation VBArtist


- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
  if (self = [super init]) {
    self.artistName = attributes[@"displayName"];
    self.displayName = attributes[@"displayName"];
    self.imagesArray = attributes[@"images"];
    self.tracksArray = [VBTrack tracksArrayFromAttributes:attributes[@"tracks"]];
  }
  return self;
}

@end
