//
// Created by Giordano Scalzo on 28/02/2014.
// Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCDeck.h"


@implementation EFCDeck {
    NSMutableSet *deck;
}

- (id)init {
    if (self = [super init]){
        deck = [NSMutableSet set];
        for (int i = 2; i < 15; i++) {
            [deck addObject:@(i)];
        }
    }
    return self;
}

- (EFCCard *)pickACard
{
    NSUInteger index = arc4random_uniform((u_int32_t)deck.count);
    NSNumber *pickedCard = [deck allObjects][index];
    [deck removeObject:pickedCard];
    return [EFCCard cardValue:[pickedCard integerValue]];
}

@end