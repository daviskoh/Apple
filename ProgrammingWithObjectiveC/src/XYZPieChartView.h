#import <Foundation/Foundation.h>
#import "XYZPieChartViewDataSourcing.h"

// Signifies that below class adopts the XYZPieViewDataSource protocol
// - no need to redeclare protocol methods below

// NOTE: compiler does not auto synthesize properties declared in adopted protocols
@interface XYZPieChartView: NSObject <XYZPieChartViewDataSourcing>
// Multiple protocols are comma-separated
// - ex: <MyProtocol, AnotherProtocol>

// angle brackets used to indiciate protocol conformance
// - compiler will throw if try to set dataSource property to object that does NOT conform to protocol
@property (weak) id <XYZPieChartViewDataSourcing> dataSource;

@end
