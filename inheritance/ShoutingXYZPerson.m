#import "ShoutingXYZPerson.h"

@implementation ShoutingXYZPerson

// override saySomething
- (void)saySomething:(NSString *)something {
    NSString *upperCaseSomething = [something uppercaseString];

    return [super saySomething: upperCaseSomething];
}

@end