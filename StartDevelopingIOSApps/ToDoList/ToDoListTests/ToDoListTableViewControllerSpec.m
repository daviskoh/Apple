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

@interface ToDoListTableViewControllerSpec : XCTestCase {
    ToDoListTableViewController *ctrl;
}

@end

// override loadInitialData for now... / consider using OCMock
@interface ToDoListTableViewController (KOHMock)

@property NSMutableArray *toDoItems;

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

- (void)testViewDidLoad {
    // ctrl.toDoItems should be undefined
    XCTAssertNil(ctrl.toDoItems);
    
    // call viewDidLoad
    [ctrl viewDidLoad];
    
    // ctrl.toDoItems should be type NSMutableArray
    XCTAssertTrue([ctrl.toDoItems isKindOfClass:[NSMutableArray class]]);
    
    // TODO: test whether loadInitialData has been called or not
}

@end
