```objective-c

#import <Foundation/Foundation.h>
 
@interface Person : NSObject {
    NSString * name;
    NSInteger age;
}

- (id)initWithName:(NSString *)name andAge:(NSInteger)age;
- (void)print;
- (void)greet;
@end

@implementation Person

- (id)initWithName:(NSString *)_name andAge:(NSInteger)_age{
    name = _name;
    age = _age;
    return self;
}

- (void)print{
    NSLog(@"Name: %@", name);
    NSLog(@"Age: %ld", age);
}

- (void)greet{
    NSLog(@"Hello, my name is %@, I am %ld years old.", name, age);
}

@end


int main(){
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];   

    Person * brian = [[Person alloc]initWithName:@"Brian Spinos" andAge:28];
    [brian print];
    [brian greet]; // Hello, my name is Brian Spinos, I am 28 years old.

   
    [pool drain];
    return 0;
}

```
