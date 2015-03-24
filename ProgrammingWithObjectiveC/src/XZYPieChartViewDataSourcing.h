#import <Foundation/Foundation.h>

@protocol XYZPieChartViewDataSourcing

- (NSUinteger)numberOfSegments;

- (CGFloat)sizeOfSegmentAtIndex:(NSUInteger)segmentIndex;

- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex;

@end
