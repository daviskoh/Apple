#import <Foundation/Foundation.h>

// NOTE: protocols can conform to other protocols
// - this is useful when functionality not covered by protocol is needed
// - w/ below, any object that adopts below protocol also adopts methods on NSObject protocol
@protocol XYZPieChartViewDataSourcing <NSObject>

// - (NSUInteger)numberOfSegments;

// - (CGFloat)sizeOfSegmentAtIndex:(NSUInteger)segmentIndex;

// NOTE: by default, all methods on a protocol are required
// - any methods that follow @optional directive are all optional
// until another directive specifies otherwise

// NOTE: if a protocol method is marked as optional,
// remember to check if an object implements it before attempting to call it
// using respondsToSelector method
@optional

- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex;

@end
