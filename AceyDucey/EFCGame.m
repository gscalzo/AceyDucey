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
    [self intro];
    BOOL continueToPlay = YES;
    while (continueToPlay) {
        @autoreleasepool {
            
            [self play_game];
            
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


#pragma game

- (void)intro
{
    NSArray *introLines = @[
                            @"Acey Ducey Card Game",
                            @"Adapted from a BASIC game from Creative Computing - Morristown, New Jersey.",
                            @"",
                            @"",
                            @"",
                            @"Acey Ducey is played in the following manner:",
                            @"The dealer (computer) deals two cards face up",
                            @"You have an option to bet or not to bet depending",
                            @"on whether or not you feel the card will have",
                            @"a value between the first two.",
                            @"If you do not want to bet, input a 0."];
    [introLines enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self puts:obj];
    }];
}

- (void)play_game
{
}

@end
