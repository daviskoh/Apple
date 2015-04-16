//
//  AppDelegate.h
//  ToDoList
//
//  Created by Davis Koh on 3/14/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// UIWindow instance used to keep track of window where ALL content is drawn
@property (strong, nonatomic) UIWindow *window;

/**
 * view hiearchy - layout of views relative to others in hierarchical structure
 * - instance of UIWindow is at top of hierarchy
 *
 * For view to be VISIBLE to user:
 * content view w/ its subviews need to be inserted into window's hierarchy
 *
 */

@end

