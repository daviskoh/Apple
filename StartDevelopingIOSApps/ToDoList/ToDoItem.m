//
//  ToDoItem.m
//  ToDoList
//
//  Created by Davis Koh on 4/24/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

- (id)initWithItemName:(NSString *)name {
    self = [super init];
    
    if (self) {
        _itemName = name;
    }
    
    return self;
}

@end
