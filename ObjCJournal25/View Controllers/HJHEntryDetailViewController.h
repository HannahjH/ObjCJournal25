//
//  HJHEntryDetailViewController.h
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJHEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface HJHEntryDetailViewController : UIViewController

@property (nonatomic, readwrite) HJHEntry *entry;

@end

NS_ASSUME_NONNULL_END
