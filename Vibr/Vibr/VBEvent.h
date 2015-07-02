//
//  VBEvent.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VBLocation;
@class VBVenue;
@class VBArtist;

@interface VBEvent : NSObject



@property (nonatomic, strong) VBArtist *artist;
@property (nonatomic, strong) VBLocation *eventLocation;
@property (nonatomic, strong) NSURL *ticketURL;
@property (nonatomic, strong) VBVenue *venue;
@property (nonatomic, strong) NSString *eventType;
@property (nonatomic, strong) NSString *startDate;



- (instancetype)initWithAttributes:(NSDictionary *)attributes;


+ (NSArray *)eventsArrayFromAttributes:(NSArray *)dictionariesArray;

+ (NSURLSessionDataTask *)eventsWithBlock:(void (^)(NSArray *eventsArray, NSError *error))block;



@end
