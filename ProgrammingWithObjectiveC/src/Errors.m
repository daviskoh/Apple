// NOTE: below code is proof of concept ONLY


#import <Foundation/Foundation.h>

// some methods require errors by reference
NSError *anyError;

BOOL success [receivedData writeToURL:someLocalFileURL
                              options:0
                                error:&anyError];

// if error occurs, writeToURL method will return NO
// & update anyError to point to error obj describing problem
if (!success) {
    NSLog(@"Write failed with error: %@", anyError);
}

// NOTE: when dealing w/ errors passed by reference
// - important to test return value of method to see whether error occurred


// Generating custom errors

// define error domain
// com.companyName.appOrFrameworkName.ErrorDomain

NSString *domain @"com.MyCompany.MyApplication.ErrorDomain";
// NSLocalizedString used to lookup localized version of error description
// from Localizable.strings file
NSString *desc = NSLocalizedString(@"Unable to...", @"");
NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };

NSError *error = [NSError errorWithDomain:domain
                                     code:-101
                                 userInfo:userInfo];

// methods that pass back errors by reference should use BOOL return value
// to indicate success or failure
// in header file:
- (BOOL)doSomethingThatMayGenAnError:(NSError **)errorPointer;
// in implementation file:
- (BOOL)doSomethingThatMayGenAnError:(NSError **)errorPointer {
    // ...
    // error occurs
    if (errorPointer) {
        *errorPointer = [NSError errorWithDomain:...
                                            code:...
                                        userInfo:...];
    }

    return NO;
}


