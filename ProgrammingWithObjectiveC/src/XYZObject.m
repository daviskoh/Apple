#import "XYZObject.h"

@implementation XYZObject

- (id)init {
    if ((self = [super init])) {
        self.blockProperty = ^{
            NSLog(@"im a blockProperty!");
        };
        self.blockProperty();
    }

    return self;
}

- (void)configureBlock {
    // explicitly use weak ref to avoid strong ref cycle (memory leak)
    XYZObject * __weak weakSelf = self;

    self.blockProperty = ^{
        NSLog(@"%@", weakSelf);
    };
}

@end
