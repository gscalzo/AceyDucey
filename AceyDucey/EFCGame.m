//
//  EFCGame.m
//  AceyDucey
//
//  Created by Giordano Scalzo on 27/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCGame.h"

@implementation EFCGame

- (void)play
{
    
    BOOL continueToPlay = YES;
    while (continueToPlay) {
        @autoreleasepool {
            [self puts:@"Try again? (yes or no)"];
            continueToPlay = [[self readFromConsole] isEqualToString:@"yes"];
        }
    }
    [self puts:@"OK, hope you had fun."];
}



- (NSString *)readFromConsole
{
    char stringFromConsole[100] = {0};
    scanf("%s", stringFromConsole);
    return @(stringFromConsole);
}

- (void)puts:(NSString *)msg
{
    printf("%s\n", [msg UTF8String]);
}


@end
