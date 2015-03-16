#import "XYZPerson.m"
#import "ShoutingXYZPerson.m"

int main() {
    XYZPerson *parent = [XYZPerson person];
    [parent sayHello];
    NSLog(@"parent isFinished message syntax: %d", [parent isFinished]);
    NSLog(@"parent isFinished dot syntax: %d", parent.isFinished);

    // NOTE: this type of logic should be within init method
    parent.firstName = @"bob";
    parent.lastName = @"broman";
    NSLog(@"%@", parent.fullName);

    ShoutingXYZPerson *person = [[ShoutingXYZPerson alloc] init];
    [person sayHello];

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
}
