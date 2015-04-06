#import <Foundation/Foundation.h>

@interface XYZObject : NSObject

// NOTE copy as property attribute
// - block needs to capture outside state
@property (copy) void (^blockProperty)(void);

// NOTE: blocks maintain strong refs to any captured objects, including self
// - easy to end up w/ strong ref cycle
- (void)configureBlock;

@end
