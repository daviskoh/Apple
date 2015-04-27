//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Davis Koh on 4/21/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] initWithItemName: @"Buy milk"];
    [_toDoItems addObject: item1];
    ToDoItem *item2 = [[ToDoItem alloc] initWithItemName: @"Buy eggs"];
    [_toDoItems addObject: item2];
    ToDoItem *item3 = [[ToDoItem alloc] initWithItemName: @"Read a book (haha)"];
    [_toDoItems addObject: item3];
}

/**
 * Target-Action
 * 
 * action message - selector defined in code
 * target - object capable of performing the action
 * 
 * ex: sender Save button in AddToDoItemViewController -> selector unwindToList: -> target ToDoListTableViewController
 */

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
}

#pragma mark - Table View Data Source Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // cell below is prototype cell in Main.storyboard
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // query toDoItems by row index
    ToDoItem *toDoItem = [_toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    NSLog(@"tableView:cellForRowAtIndexPath:");
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSElectRowAtIndexPath:(NSIndexPath *)indexPath {
    // NOTE: cell is selected by default
    // deselect cell immediately after selection
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // query ToDoItem via index
    ToDoItem *tappedItem = [_toDoItems objectAtIndex:indexPath.row];
    
    // toggle completion state
    tappedItem.completed = !tappedItem.completed;
    
    // reload associated table view data
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
