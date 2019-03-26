//
//  HJHEntryTableViewController.m
//  ObjCJournal25
//
//  Created by Hannah Hoff on 3/25/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

#import "HJHEntryTableViewController.h"
#import "HJHEntryController.h"
#import "HJHEntryDetailViewController.h"

@interface HJHEntryTableViewController ()

@end

@implementation HJHEntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[HJHEntryController shared] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    HJHEntry *entry = [[HJHEntryController shared] entries][indexPath.row];
    cell.textLabel.text = entry.title;
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM-dd-yyyy"];
    NSString *newDate = [df stringFromDate:entry.timestamp];
    cell.detailTextLabel.text = newDate;
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        HJHEntry *entry = [[HJHEntryController shared] entries][indexPath.row];
        [[HJHEntryController shared] removeEntry:entry];
        [tableView reloadData];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toEntryDetailVC"]){
        
        NSIndexPath *index = [[self tableView] indexPathForSelectedRow];
        HJHEntryDetailViewController *destinationVC = [segue destinationViewController];
        HJHEntry *entry = [[HJHEntryController shared] entries][index.row];
        destinationVC.entry = entry;
        
    }
    
}

@end
