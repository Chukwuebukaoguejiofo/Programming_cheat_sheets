# Objective-c tutorial

# log
```objective-c
NSLog(@"Brian"); // log string "brian"
NSLog(firstName); // log variable
```

# variables
```objective-c
// syntax: <object-type> *<variable-name> = @<value>;
NSString *firstName = @"brian";
```
# interpolation
```objective-c
NSLog(@"Hello there, %@.", firstName);
```

# integer
```objective-c
NSNumber *age = @768;
```
# array
```objective-c
NSArray *apps = @[@"AngryFowl", @"Lettertouch", @"Tweetrobot"];
// redefine 'apps'
apps = @[@"AngryFowl", @"Lettertouch", @"Tweetrobot", @"Instacanvas"];
```

# log array element
```objective-c
NSLog(@"%@", apps[1]);
```
# dictionaries
```objective-c
// like ruby hashes

NSDictionary *person = @{@"First Name": @"Eric"};

NSDictionary *appRatings = @{@"AngryFowl": @3, @"Lettertouch": @5};

// access value of a key:
NSLog(@"Lettertouch has a rating of %@.", appRatings[@"Lettertouch"]); // "Lettertouch has a rating of 5"
```

# send message
```objective-c
// like ruby functions

// syntax:   [object function];
// the key-word: 'description' is like ruby's '.inspect' method

NSArray *foods = @[@"tacos", @"burgers"];
NSLog(@"%@", [foods description]);

// storing the return of the function in a variable:
NSArray *foods = @[@"tacos", @"burgers"];
NSString *result = [foods description];
NSLog(@"%@", result);
```

# append to string:
```objective-c
NSString *firstName = @"brian";
NSString *lastName = @"spinos";

NSString *fullName = [firstName stringByAppendingString:lastName];
NSLog(@"%@", fullName);

```
# nested functions
```objective-c
NSString *firstName = @"brian";
NSString *lastName = @"spinos";

NSString *fullName = [ [firstName stringByAppendingString:@" "] stringByAppendingString:lastName];

NSLog(@"%@", fullName);
```
