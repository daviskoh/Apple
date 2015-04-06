#import "XYZPerson.m"
#import "ShoutingXYZPerson.m"
#import "XYZBadgeView.m"
#import "NSString+Reverse.m"
#import "XYZPieChartView.m"
#import "XYZCalculator.m"
#import "XYZSimpleBlock.m"
#import "XYZObject.m"

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

        // for mutability, use NSMutableArray
        NSMutableArray *mutableArray = [NSMutableArray array];
        [mutableArray addObject:@"meow"];
        [mutableArray addObject:@"dude"];
        [mutableArray addObject:@"bro"];
        [mutableArray replaceObjectAtIndex:0 withObject:@"cat"];
        NSLog(@"mutable array: %@", mutableArray);

        // NSSets are unordered group of distinct objects
        // NOTE: NSSets use hashmaps so lookups are FASTER than NSArrays that have to iteration to find values
        // NSSets maintain only 1 reference to individual object
        NSSet *simpleSet = [NSSet setWithObjects:@"Hello, World!", @42, @42, nil];
        NSLog(@"a set: %@, ", simpleSet);

        // NSDictionary
        NSDictionary *dict = @{
            @"anObject" : @"meow",
            @"aNumber" : @32
        };
        NSLog(@"anObject in dict: %@", dict[@"anObject"]);

        // NSMutableDictionary subclass
        NSMutableDictionary *mutableDict = [dict mutableCopy];
        [mutableDict setObject:@"anObject has been REPLACED" forKey:@"anObject"];
        NSLog(@"mutableDict: %@", mutableDict);

        // NOTE: not possible to add nil to collection types (because nil means "no object"
        // - use NSNull class to rep nil
        // - because NSNull is a singleton, its null method will always return same isntance
        // - can be used to check conditionals
        // NOTE: NSFastEnumeration below
        NSArray *arrayWithNull = @[@"string", @11, [NSNull null]];
        for (id obj in arrayWithNull) {
            if (obj == [NSNull null]) {
                NSLog(@"Found a null object");
            }
        }

        // Blocks
        // NOTE: attempting to invoke a nil value pointer to block will throw
        void (^simpleBlock)(void) = ^{
            NSLog(@"This is a block");
        };
        simpleBlock();

        // blocks w/ args
        // NOTE: return type can be implicit by omitting return type for value
        double (^multiplyTwoValues)(double, double) = ^ double (double firstValue, double secondValue) {
            return firstValue * secondValue;
        };
        NSLog(@"multiplyTwoValues %f", multiplyTwoValues(2, 3));

        // Blocks have access to outside scope like JS closures
        // - outside values are captured
        // NOTE: thus blocks cannot change outside value as it's captured as a const
        // - use __block to designate that a var lives in shared storage bet lexical scope & scope of blocks declarated within
        int anInt = 32;
        __block int anotherInt = 32;
        void (^useAnInt)(void) = ^{
            NSLog(@"useAnInt from already captured outside scope: %i", anInt);
            NSLog(@"anotherInt from capture outside scope: %i", anotherInt);
        };
        anInt = 88;
        anotherInt = 99;
        NSLog(@"modifying anInt value to: %i", anInt);
        NSLog(@"modyfing anotherInt value to: %i", anotherInt);
        useAnInt();

        // uses block typedef from XYZSimpleBlock.m
        XYZSimpleBlock anotherBlock = ^{
            NSLog(@"anotherBlock");
        };
        anotherBlock();
        XYZSimpleBlock andAnotherBlock = ^{
            NSLog(@"andAnotherBlock");
        };
        andAnotherBlock();

        // blocks as properties of objects
        NSLog(@"myObj here below has a block as a property");
        XYZObject *myObj = [[XYZObject alloc] init];

        // blocks to make enumeration easier
        NSArray *arrForEnum = @[@1, @2, @3];
        [arrForEnum enumerateObjectsUsingBlock:^ (id obj, NSUInteger i, BOOL *stop) {
            if ([obj intValue] == 2) {
                // use pointer to stop to terminate loop
                *stop = YES;
            }

            NSLog(@"Object at index %lu is %@", i, obj);
        }];

        // same enumeration using concurrency option
        [arrForEnum enumerateObjectsWithOptions:NSEnumerationConcurrent
                                     usingBlock:^ (id obj, NSUInteger i, BOOL *stop) {
            NSLog(@"concurrently enumerate: Object at index %lu is %@", i, obj);
        }];

        // Concurrency w/ Blocks
        // - Operation Queues used for task scheduling
        // - can configure dependencies bet operations like waiting for one op to fin
        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"NSBlockOperation");
        }];
        // schedule task on main queue
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        [mainQueue addOperation:op];
        // NOTE: below will cause executable to hang
        // schedule task on background queue
        // NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
        // [backgroundQueue addOperation:op];

        // Grand Central Dispatch (GCD)
        // - schedule arbitrary block of execution
        // get ref to existing queue
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        // to dispatch use dispatch_async() or dispatch_sync()
        dispatch_async(queue, ^{
            NSLog(@"Block for asynchronous execution");
        });

        NSLog(@"I should occur before the 'Block for asynchronous execution'");






        NSLog(@"*************************************");
    }
}

