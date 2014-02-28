//
//  EFCGame.m
//  AceyDucey
//
//  Created by Giordano Scalzo on 27/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCGame.h"
#import "EFCDeck.h"

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
    fflush(stdout);
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
    NSUInteger money = 100;
    
    while (money > 0) {
        EFCDeck *deck = [EFCDeck new];

        EFCCard *firstCard = [deck pickACard];
        EFCCard *secondCard = [deck pickACard];

        NSUInteger bet = [self betGivenMax:money];
        if ( bet > 0) {
            EFCCard *thirdCard = [deck pickACard];
            [self puts:[NSString
                    stringWithFormat:@"The first card was [%@], the second was [%@] and the third was [%@]",
                    firstCard, secondCard, thirdCard]
            ];
            money= [self playGIvenMax:money firstCard:firstCard secondCard:secondCard bet:bet thirdCard:thirdCard];
        }
    }
}

- (NSUInteger)playGIvenMax:(NSUInteger)money firstCard:(EFCCard *)firstCard secondCard:(EFCCard *)secondCard bet:(NSUInteger)bet thirdCard:(EFCCard *)thirdCard {
    if([thirdCard isInsideCard:firstCard
                       andCard:secondCard] ) {
                [self puts:@"You win!!!"];
                money += bet;
            } else {
                [self puts:@"You lose."];
                money -= bet;
            }
    return money;
}

- (NSUInteger)betGivenMax:(NSUInteger)money {
    NSUInteger bet = 0;
    BOOL isValidBet = NO;
    while(!isValidBet){
            [self puts:@"What is your bet?"];
            bet = [[self readFromConsole] integerValue];

            if (bet == 0){
                [self puts:@"Chicken!!"];
                isValidBet = YES;
            } else if (bet > money) {
                [self puts:@"Sorry, my friend but you have bet to much."];
                [self puts:[NSString stringWithFormat:
                @"You have only %d dollars to bet.", money]];
            } else {
                isValidBet = YES;
            }
        }
    return bet;
}


@end
