#import "XYZPerson.h"

// unlike categories, class extensions done at "compile time"

// class extensions are provide private methods & properties for use
// within "implementation" of class itself
// ex: interface declares property as "readonly"
// - extension declares as "readwrite" in order to change property value directly
@interface XYZPerson () {
    // private instance vars added using class extensions
    id _someCustomInstanceVariable;
}

// compiler automatically synthesizes relevant accessor methods & instance var
@property NSObject *extraProperty;

// redefine uniqueIdentifier as readwrite
// so that it can be set directly within implementation using a setter
@property (readwrite) NSString *uniqueIdentifier;

@end


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
    NSLog(@"XYZPerson %@ is being deallocated", self.firstName);
}

// custom accessor method
- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
