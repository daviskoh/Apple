#import "XYZPerson.h"

// add XYZPersonNameDisplayAdditions category to XYZPerson
// BEST PRACTICE: add prefix to category (like XYZ) to prevent clashing
@interface XYZPerson (XYZPersonNameDisplayAdditions)

// categories can be used to organize / separate massive classes by functionality

// NOTE: categories are not suitable for adding properties

- (NSString *)lastNameFirstNameString;

- (NSString *)reversedName;

@end
