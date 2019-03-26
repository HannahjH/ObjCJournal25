//
//  HJHEntry.m
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHEntry.h"

@implementation HJHEntry

- (instancetype)initWithName:(NSString *)title bodyText:(NSString *)bodyText timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = [[NSDate alloc] init];
        
    }
    return self;
}

@end
