#import "XYZBadgeView.h"

@implementation XYZBadgeView

- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName {
    self = [super init];

    if (self) {
        // NOTE: firstName is a copy
        _firstName = [aFirstName copy];
        _lastName = aLastName;
    }

    return self;
}

@end
