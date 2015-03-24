#import <Foundation/Foundation.h>

@interface XYZPieChartView: UIView

// angle brackets used to indiciate protocol conformance
// - compiler will throw if try to set dataSource property to object that does NOT conform to protocol
@property (weak) id <XYZPieChartViewDataSource> dataSource;

@end
