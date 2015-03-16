#import "XYZPerson.h"

@implementation XYZPerson

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
