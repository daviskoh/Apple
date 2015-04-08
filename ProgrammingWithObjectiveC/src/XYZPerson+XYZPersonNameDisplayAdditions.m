#import "XYZPerson+XYZPersonNameDisplayAdditions.h"
#import "NSString+KOHReverse.h"

@implementation XYZPerson (XYZPersonNameDisplayAdditions)

- (NSString *)lastNameFirstNameString {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

- (NSString *)reversedName {
    NSString *fullName = [NSString stringWithFormat: @"%@ %@", self.firstName, self.lastName];
    return [fullName koh_reverse];
}

@end
