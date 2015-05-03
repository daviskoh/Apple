//
//  ToDoListTableViewControllerSpec.m
//  ToDoList
//
//  Created by Davis Koh on 5/2/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TodoListTableViewController.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableViewControllerSpec : XCTestCase {
    ToDoListTableViewController *ctrl;
}

@end

// override loadInitialData for now... / consider using OCMock
@interface ToDoListTableViewController (KOHMock)

@property (readwrite) NSMutableArray *toDoItems;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@implementation ToDoListTableViewControllerSpec

- (void)setUp {
    [super setUp];
    ctrl = [[ToDoListTableViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - viewDidLoad

- (void)testToDoItemsSetWhenViewLoads {
    // ctrl.toDoItems should be undefined
    XCTAssertNil(ctrl.toDoItems);
    
    // call viewDidLoad
    [ctrl viewDidLoad];
    
    // ctrl.toDoItems should be type NSMutableArray
    XCTAssertTrue([ctrl.toDoItems isKindOfClass:[NSMutableArray class]]);
    
    // TODO: test whether loadInitialData has been called or not
}

#pragma mark - unwindToList

- (void)testAddNewToDo {}

- (void)testEmptyToDoItem {}

#pragma mark - tableView:numberOfRowsInSection

- (void)testNumberOfRowsPerSection {
    NSInteger count;
    
    count = [ctrl tableView:[[UITableView alloc] init] numberOfRowsInSection:1];
    XCTAssertEqual(count, 0);
    
    // add ToDo
    ctrl.toDoItems = [[NSMutableArray alloc] init];
    [ctrl.toDoItems addObject: [[ToDoItem alloc] init]];
    
    count = [ctrl tableView:[[UITableView alloc] init] numberOfRowsInSection:1];
    XCTAssertEqual(count, 1);
}

#pragma mark - tableView:cellForRowAtIndex

// Unit Testing Storyboard-linked functionality is difficult...

#pragma mark - tableView:didSelectRowAtIndex

@end
