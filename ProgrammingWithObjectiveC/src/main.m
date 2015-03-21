#import "XYZPerson.m"
#import "ShoutingXYZPerson.m"
#import "XYZBadgeView.m"
#import "NSString+Reverse.m"

// must import category into every file that uses it
#import "XYZPerson+XYZPersonNameDisplayAdditions.m"

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

        XYZPerson *husband = [[XYZPerson alloc] initWithFirstName:@"Jack"
                                                      lastName:@"Meow"
                                                   dateOfBirth:nil];
        XYZPerson *wife = [[XYZPerson alloc] initWithFirstName:@"Jackie"
                                                      lastName:@"Meow"
                                                   dateOfBirth:nil];

        husband.spouse = wife;
        wife.spouse = husband;

        NSLog(@"husband's spouse: %@", husband.spouse.firstName);
        NSLog(@"wife's spouse: %@", wife.spouse.firstName);

        NSLog(@"last name, first name: %@", [husband lastNameFirstNameString]);

        NSLog(@"husband's reversed name: %@", [husband reversedName]);

        printf("husband's height: %i & weight: %i \n", husband.heightInInches, husband.weightInPounds);

        [husband measureHeight];
        [husband measureWeight];

        printf("husband's height: %i & weight: %i \n", husband.heightInInches, husband.weightInPounds);
        
    }
}
