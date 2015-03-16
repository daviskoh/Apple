#import "ShoutingXYZPerson.h"

@implementation ShoutingXYZPerson

- (id)init {
    self = [super init];

    if (self) {
        NSLog(@"ShoutingXYZPerson init called");
    }

    return self;
}

// override saySomething
- (void)saySomething:(NSString *)something {
    NSString *upperCaseSomething = [something uppercaseString];

    return [super saySomething: upperCaseSomething];
}

@end
