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
        for (int i = 1; i < 15; i++) {
            [deck addObject:@(i)];
        }
    }
    return self;
}

- (NSNumber *)pickACard
{
    NSUInteger index = arc4random_uniform((u_int32_t)deck.count);
    NSNumber *pickedCard = [deck allObjects][index];
    [deck removeObject:pickedCard];
    return pickedCard;
}

@end