//
//  VBTrack.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBTrack.h"

@implementation VBTrack

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
  if (self = [super init]) {
    self.audioUrlString = attributes[@"preview"];
    self.displayName    = attributes[@"name"];
  }
  return self;
  
  
}


+ (NSArray *)tracksArrayFromAttributes:(NSArray *)dictionariesArray
{
  __block NSMutableArray *eventsArray = [NSMutableArray array];
  [dictionariesArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
    VBTrack *track = [[VBTrack alloc] initWithAttributes:dict];
    [eventsArray addObject:track];
  }];
  return eventsArray;
}
@end
