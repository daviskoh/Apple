#import <Foundation/Foundation.h>

@interface XYZPerson: NSObject

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSDate *dateOfBirth;
// can add multi attrs to properties via comma separation
// can specify custom getter as is customary for boolean properties
@property (readonly, getter=isFinished) BOOL finished;

+ (id)person;

- (void)saySomething:(NSString *)something;

- (void)sayHello;

@end
