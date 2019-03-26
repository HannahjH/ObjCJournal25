//
//  HJHEntryController.h
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJHEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface HJHEntryController : NSObject

// Shared Instance
+ (HJHEntryController *)shared;

// Source of truth
@property (nonatomic, readwrite) NSMutableArray <HJHEntry *> *entries;

-(void)createEntry:(HJHEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp;
-(void)removeEntry:(HJHEntry *)entry;

@end

NS_ASSUME_NONNULL_END
