//
//  ToDoItemSpec.m
//  ToDoList
//
//  Created by Davis Koh on 4/29/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ToDoItem.h"

@interface ToDoItemSpec : XCTestCase {
    ToDoItem *_todo;
}

@end

@implementation ToDoItemSpec

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithItemName {
    NSString *itemName = @"bro-montana";
    
    _todo = [[ToDoItem alloc] initWithItemName:itemName];
    
    XCTAssertEqualObjects(_todo.itemName, itemName, @"should set itemName upon initialization");
}


@end
