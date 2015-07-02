//
//  VBEvent.m
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import "VBEvent.h"
#import "VBLocation.h"
#import "VBVenue.h"
#import "VBArtist.h"

#import <Spotify/Spotify.h>
#import "AFAppDotNetAPIClient.h"
#import "VBTrack.h"


@implementation VBEvent


+ (NSArray *)eventsArrayFromAttributes:(NSArray *)dictionariesArray
{
  __block NSMutableArray *eventsArray = [NSMutableArray array];
  [dictionariesArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
    VBEvent *event = [[VBEvent alloc] initWithAttributes:dict];
    [eventsArray addObject:event];
  }];
  return eventsArray;
}


- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
  if (self = [super init]) {
    self.artist = [[VBArtist alloc] initWithAttributes:attributes[@"artist"]];
    self.eventLocation = [[VBLocation alloc] initWithAttributes:attributes[@"location"]];
    self.ticketURL = [NSURL URLWithString:attributes[@"ticket_url"]];
    self.venue = [[VBVenue alloc] initWithAttributes:attributes[@"venue"]];
    self.eventType = attributes[@"type"];
    self.startDate = attributes[@"start"][@"date"];
  
  }
  return self;
}

+ (NSURLSessionDataTask *)eventsWithBlock:(void (^)(NSArray *eventsArray, NSError *error))block
{
  SPTSession *session = [[SPTAuth defaultInstance] session];
  
  return [[AFAppDotNetAPIClient sharedClient] GET:@"app/events" parameters:@{@"token":session.accessToken}
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                            
                                            NSArray *eventsArray = [VBEvent eventsArrayFromAttributes:responseObject[@"data"]];
                                            
                                            block (eventsArray, nil);
  }
                                          failure:^(NSURLSessionDataTask *task, NSError *error) {
                                            block (nil, error);

  
  }];
}


@end
