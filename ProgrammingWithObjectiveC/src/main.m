#import "XYZPerson.m"
#import "ShoutingXYZPerson.m"
#import "XYZBadgeView.m"

int main() {
    @autoreleasepool {
        XYZPerson *parent = [XYZPerson person];
        [parent sayHello];
        NSLog(@"parent isFinished message syntax: %d", [parent isFinished]);
        NSLog(@"parent isFinished dot syntax: %d", parent.isFinished);

        // NOTE: this type of logic should be within init method
        parent.firstName = @"bob";
        parent.lastName = @"broman";
        NSLog(@"%@", parent.fullName);

        // uncomment to see retaining
        // ShoutingXYZPerson __weak *person;
        //ShoutingXYZPerson *retainedPerson = person;
        //person = [[ShoutingXYZPerson alloc] init];
        //[person sayHello];
        //retainedPerson = nil;
        //person = nil;

        // notice init order in logs
        // - should see NSLog of XYZPerson then ShoutingXYZPerson
        ShoutingXYZPerson *child = [ShoutingXYZPerson person];
        [child sayHello];

        XYZPerson *empty;

        if (empty) {
           NSLog(@"NOT empty");
           NSLog(@"%@", empty);
        } else {
            NSLog(@"empty");
        }

        // NOTE: strong references by default
        // below is how to use weak reference for vars
        NSObject * __weak weakVariable;
        // NOTE: good practice to make sure weak prop is not nil before using it
        // - in multi-threaded env, it may be deallocated so best to use strong ref cache

        NSObject *cachedObj = weakVariable;
        if (cachedObj) {
            NSLog(@"weak var cache is not nil");
        }
        // strong var cachedObj is set to nil to give up strong reference
        cachedObj = nil;
        // at this point, no other strong refs to weakVariable so it will be set to nil


        XYZBadgeView *badge = [[XYZBadgeView alloc] init];
        NSMutableString *nameString = [NSMutableString stringWithString:@"John"];
        // firstName is copy
        badge.firstName = nameString;
        // lastName is not copy
        badge.lastName = nameString;
        [nameString appendString:@"ny is APPENDED"];
        NSLog(@"%@", badge.firstName);
        NSLog(@"%@", badge.lastName);
    }
}
