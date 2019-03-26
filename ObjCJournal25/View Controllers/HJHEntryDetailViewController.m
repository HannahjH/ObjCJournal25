//
//  HJHEntryDetailViewController.m
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHEntryDetailViewController.h"
#import "HJHEntry.h"
#import "HJHEntryController.h"


@interface HJHEntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation HJHEntryDetailViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void)updateViews {
    if (self.entry) {
    self.titleTextField.text = self.entry.title;
    self.bodyTextView.text = self.entry.bodyText;
    }
}

- (IBAction)clearButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
    
}
- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _titleTextField.text;
    NSString *bodyText = _bodyTextView.text;
    
    [[HJHEntryController shared] createEntry:_entry title:title bodyText:bodyText timestamp:_entry.timestamp];
    
    [[self navigationController] popViewControllerAnimated:true];
    
}


@end
