#import "XYZPerson+XYZPersonNameDisplayAdditions.h"
#import "NSString+Reverse.h"

@implementation XYZPerson (XYZPersonNameDisplayAdditions)

- (NSString *)lastNameFirstNameString {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

- (NSString *)reversedName {
    NSString *fullName = [NSString stringWithFormat: @"%@ %@", self.firstName, self.lastName];
    return [fullName reverse];
}

@end
