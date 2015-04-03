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

@end
