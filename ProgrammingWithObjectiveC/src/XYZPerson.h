#import <Foundation/Foundation.h>

@interface XYZPerson: NSObject

// properties use "strong" references for synthesized instance vars by default
// need to specify "weak" if desired

// readwrite property is backed by instance variable synthesized by default
// instance var - var that exists & holds value for life of object
// - memory used for instance var allocated when obj created 
// - memory used for instance var freed when obj deallocated
// - vars synthesized by compiler w/ '_' prefix
@property (readwrite, assign) NSString *firstName;
@property (readwrite, assign) NSString *lastName;
@property (readonly) NSString *fullName;
@property (readonly) NSDate *dateOfBirth;

// properties are atomic by default
// - synthesize accessors ensure:
// 1. value fully retrieved via getter
// 2. value fully set via setter
// even if called simultaneously from different threads
@property (atomic, retain) NSObject *explicitAtomicObject;

// can specify nonatomic
// - no guarantee about what happens when same value accessed simultaneously
// - nonatomic is significantly faster
@property (nonatomic, retain) NSObject *nonAtomicObject;

// NOTE: atomicity NOT synonymous w/ object's thread safety

// can add multi attrs to properties via comma separation
// can specify custom getter as is customary for boolean properties
@property (readonly, getter=isFinished) BOOL finished;

+ (id)person;

- (void)saySomething:(NSString *)something;

- (void)sayHello;

@end
