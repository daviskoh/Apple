#import "XYZCalculator.h"

@implementation XYZCalculator

- (void)increment {
    self.currentValue++;
}

- (void)decrement {
    self.currentValue--;
}

- (void)multiplyBy:(double)factor {
    self.currentValue *= factor;
}

@end
