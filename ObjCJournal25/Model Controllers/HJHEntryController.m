//
//  HJHEntryController.m
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHEntryController.h"
#import "HJHEntry.h"

@implementation HJHEntryController

+ (HJHEntryController *)shared
{
    static HJHEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[HJHEntryController alloc] init];
        shared.entries = [NSMutableArray new];
    });
    return shared;
}

-(void)createEntry:(HJHEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    entry.title = title;
    entry.bodyText = bodyText;
    
}

-(void)removeEntry:(HJHEntry *)entry
{
    [[[HJHEntryController shared] entries] removeObject:entry];
}

@end
