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
@property (nonatomic, readwrite) NSMutableArray *entries;

-(void)createEntry:(HJHEntry *)entry;
-(void)removeEntry:(HJHEntry *)entry;
-(void)updateEntry: (HJHEntry *)entry withTitle:(NSString *)title bodyText:(NSString *)bodyText;
-(void)saveToPersistentStore;
-(void)loadFromPersistentStore;


@end

NS_ASSUME_NONNULL_END
