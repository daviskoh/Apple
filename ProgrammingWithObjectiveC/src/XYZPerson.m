#import "XYZPerson.h"

@implementation XYZPerson

// can synthesize custom names for instance var ex:
// @synthesize firstName = ivar_firstName;
// - will allow prop to still be accessible via firstName, etc
// - now will be backed by instance var called ivar_firstName

+ (id)person {
    return [[self alloc] init];
}

// init method w/ most args is "designated initializer"
- (id)initWithFirstName:(NSString *)aFirstName
	       lastName:(NSString *)aLastName
	    dateOfBirth:(NSDate *)aDOB {
    self = [super init];

    if (self) {
        _firstName = aFirstName;
	    _lastName = aLastName;
    }

    return self;
}

// should override init method to call designated initalizer
// w/ proper args
// NOTE: when overriding superclass' init, should call "designated initializer"
- (id)init {
    return [self initWithFirstName:@"John" lastName:@"Doe" dateOfBirth:nil];
}

- (void)saySomething:(NSString *)something {
    NSLog(@"%@", something);
}

- (void)sayHello {
    [self saySomething: [
            NSString stringWithFormat:@"Hello, world! My name is %@", [self fullName]
        ]
    ];
}

- (void)dealloc {
    NSLog(@"XYZPerson is being deallocated");
}

// custom accessor method
- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
