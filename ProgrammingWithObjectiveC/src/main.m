#import "XYZPerson.m"
#import "ShoutingXYZPerson.m"
#import "XYZBadgeView.m"
#import "NSString+Reverse.m"
#import "XYZPieChartView.m"
#import "XYZCalculator.m"

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

        NSInteger meowCount = 1;
        NSLog(@"meowCount: %ld", meowCount);

        // NSStrings are immutable
        NSString *immutableString = @"immutable";
        [immutableString stringByAppendingString:@" string"];
        NSLog(@"immutable: %@", immutableString);

        NSMutableString *mutableString = [
            NSMutableString stringWithFormat:@"mutable"
        ];
        [mutableString stringByAppendingString:@" string"];
        NSLog(@"mutable: %@", mutableString);

        // NSNumber hold C scalar number types
        // scalar values are requested using accessors
        NSNumber *magicNumber = @42;
        int theMagic = [magicNumber intValue];
        NSNumber *simpleFloat = @4.3f;
        float theFloatery = [simpleFloat floatValue];
        // NOTE: the SINGLE quotes for char types
        NSNumber *someChar = @'T';
        char thatChar = [someChar charValue];
        printf("int: %i, float: %f, char: %c \n", theMagic, theFloatery, thatChar);

        // variadic methods are "nil-terminated" which mean last arg must be nil
        NSArray *properNilTerminatedArray = [NSArray arrayWithObjects: @"string", @1, nil];
        NSLog(@"properNilTerminatedArray: %@", properNilTerminatedArray);
        NSArray *improperNilTerminatedArray = [NSArray arrayWithObjects: @"string", nil, @1, nil];
        NSLog(@"improperNilTermiantedArray: %@", improperNilTerminatedArray);
        // NOTE: cannot have nil value when using literal syntax
        // - use NSNull singleton class to rep nil
        NSArray *literalArray = @[@"string", @1];
        NSLog(@"literalArray: %@", literalArray);

        // query array
        if ([literalArray count] > 0) {
            // below is shorthand for [literalArray objectAtIndex: 0]
            NSLog(@"1st item of literalArray: %@", literalArray[0]);
        }

        // sort arrays using selectors
        NSArray *unSortedArray = @[@"z", @"e", @"f", @"a"];
        NSArray *sortedArray = [unSortedArray sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"unsorted array: %@", unSortedArray);
        NSLog(@"sorted array: %@", sortedArray);

    }
}

