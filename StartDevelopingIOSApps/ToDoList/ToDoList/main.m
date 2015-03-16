//
//  main.m
//  ToDoList
//
//  Created by Davis Koh on 3/14/15.
//  Copyright (c) 2015 com.DavisKoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
  @autoreleasepool {
      /**
       * UIApplicationMain creates 2 components:
       * 
       * 1) instance of UIApplication (application object)
       * - manages app event loop & other behaviors
       * 
       * 2) instance of AppDelegate (app delegate)
       * - creates window where content is drawn
       * - provides place to resp to state transitions
       */
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
