#import <Foundation/Foundation.h>

@interface XYZPerson: NSObject

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSDate *dateOfBirth;

+ (id)person;

- (void)saySomething:(NSString *)something;

- (void)sayHello;

@end