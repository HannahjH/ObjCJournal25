//
//  HJHEntry.h
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJHEntry : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *bodyText;
@property (nonatomic) NSDate *timestamp;

-(instancetype) initWithName:(NSString *)title bodyText: (NSString *)bodyText timestamp:(NSDate *)timestamp;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionaryRepresentation;
@end

NS_ASSUME_NONNULL_END
