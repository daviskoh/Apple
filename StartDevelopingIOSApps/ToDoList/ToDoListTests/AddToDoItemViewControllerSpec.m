//
//  AddToDoItemViewControllerSpec.m
//  ToDoList
//
//  Created by Davis Koh on 4/30/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AddToDoItemViewController.h"
#import "ToDoItem.h"

@interface AddToDoItemViewController (KOHOverridePropertiesForTesting)

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@interface AddToDoItemViewControllerSpec : XCTestCase {
    AddToDoItemViewController *ctrl;
}

@end

@implementation AddToDoItemViewControllerSpec

- (void)setUp {
    [super setUp];
    
    ctrl = [[AddToDoItemViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Test Navigation

- (void)testSave {
    UIStoryboardSegue *dummySegue = [[UIStoryboardSegue alloc] init];
    
    NSString *toDoText = @"Milk a Cow";
    
    ctrl.textField = [[UITextField alloc] init];
    ctrl.textField.text = toDoText;
    ctrl.saveButton = [[UIBarButtonItem alloc] init];
    
    [ctrl prepareForSegue:dummySegue sender:ctrl.saveButton];
    
    XCTAssertTrue([ctrl.toDoItem isKindOfClass:[ToDoItem class]]);
    XCTAssertEqualObjects(ctrl.toDoItem.itemName, toDoText);
    XCTAssertFalse(ctrl.toDoItem.completed);
}

- (void)testEmptyTextField {
    
}

- (void)testCancel {
    
}

@end
