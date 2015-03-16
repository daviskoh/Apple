#import "XYZPerson.m"
#import "ShoutingXYZPerson.m"

int main() {
    XYZPerson *parent = [XYZPerson person];
    [parent sayHello];
    NSLog(@"parent isFinished message syntax: %d", [parent isFinished]);
    NSLog(@"parent isFinished dot syntax: %d", parent.isFinished);

    ShoutingXYZPerson *person = [[ShoutingXYZPerson alloc] init];
    [person sayHello];

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
