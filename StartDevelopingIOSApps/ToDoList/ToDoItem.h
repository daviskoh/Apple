//
//  ToDoItem.h
//  ToDoList
//
//  Created by Davis Koh on 4/24/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

- (id)initWithItemName:(NSString *)name;

@end
