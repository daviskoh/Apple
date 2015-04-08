#import "NSString+KOHReverse.h"

@implementation NSString (KOHReverse)
    - (id)koh_reverse {
        if (self.length == 0) {
            return @"";
        }

        NSString *firstChar = [self substringToIndex: 1];
        NSRange subStringRange = NSMakeRange(1, self.length - 1);

        return [
            [[self substringWithRange: subStringRange] koh_reverse]
            stringByAppendingString: firstChar
        ];
    }
@end
