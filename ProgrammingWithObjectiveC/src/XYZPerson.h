#import <Foundation/Foundation.h>

@interface XYZPerson: NSObject

// readwrite property is backed by instance variable synthesized by default
// instance var - var that exists & holds value for life of object
// - memory used for instance var allocated when obj created 
// - memory used for instance var freed when obj deallocated
// - vars synthesized by compiler w/ '_' prefix
@property (readwrite, assign) NSString *firstName;
@property (readwrite, assign) NSString *lastName;
@property (readonly) NSString *fullName;
@property (readonly) NSDate *dateOfBirth;

// can add multi attrs to properties via comma separation
// can specify custom getter as is customary for boolean properties
@property (readonly, getter=isFinished) BOOL finished;

+ (id)person;

- (void)saySomething:(NSString *)something;

- (void)sayHello;

@end
