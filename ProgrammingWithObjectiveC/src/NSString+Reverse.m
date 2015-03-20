#import "NSString+Reverse.h"

@implementation NSString (Reverse)
    - (id)reverse {
        if (self.length == 0) {
            return @"";
        }

        NSString *firstChar = [self substringToIndex: 1];
        NSRange subStringRange = NSMakeRange(1, self.length - 1);

        return [
            [[self substringWithRange: subStringRange] reverse]
            stringByAppendingString: firstChar
        ];
    }
@end
