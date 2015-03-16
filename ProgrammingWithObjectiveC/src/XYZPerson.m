#import "XYZPerson.h"

@implementation XYZPerson

// can synthesize custom names for instance var ex:
// @synthesize firstName = ivar_firstName;
// - will allow prop to still be accessible via firstName, etc
// - now will be backed by instance var called ivar_firstName

+ (id)person {
    return [[self alloc] init];
}

- (void)saySomething:(NSString *)something {
    NSLog(@"%@", something);
}

- (void)sayHello {
    [self saySomething: @"Hello, world!"];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
