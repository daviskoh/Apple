#import <Foundation/Foundation.h>

@interface XYZObject : NSObject

// NOTE copy as property attribute
// - block needs to capture outside state
@property (copy) void (^blockProperty)(void);

@end
