//
//  HJHEntryController.m
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHEntryController.h"

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

-(void)createEntry:(HJHEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStore];
    
}

-(void)removeEntry:(HJHEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStore];
}

- (void)updateEntry:(HJHEntry *)entry withTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
    [self saveToPersistentStore];
}

-(void)saveToPersistentStore
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (HJHEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

-(void)loadFromPersistentStore
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        HJHEntry *entry = [[HJHEntry new] initWithDictionary:dictionary];
        [self createEntry:entry];
        
    }
    
}

@end
