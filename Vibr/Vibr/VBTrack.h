//
//  VBTrack.h
//  Vibr
//
//  Created by Michal Tomaszewski on 01/07/15.
//  Copyright (c) 2015 vibr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBTrack : NSObject

@property (strong,nonatomic) NSString *displayName;
@property (strong,nonatomic) NSString *audioUrlString;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;


+ (NSArray *)tracksArrayFromAttributes:(NSArray *)dictionariesArray;

@end
