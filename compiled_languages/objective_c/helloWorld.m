#import <Foundation/Foundation.h>

/*
 * a simple hello world in Objective-c
 */
int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    NSLog (@"hello world");
    [pool drain];
    return 0;
}
