//
// Created by Giordano Scalzo on 28/02/2014.
// Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import "EFCCard.h"

@interface EFCCard ()

@property (nonatomic, assign)NSUInteger value;

@end

@implementation EFCCard

+ (EFCCard *)cardValue:(NSUInteger)value
{
    EFCCard *card = [EFCCard new];
    card.value = value;

    return card;
}

- (BOOL)isGreaterThan:(EFCCard *)other
{
    return self.value > other.value;
}
- (BOOL)isEqualTo:(EFCCard *)other {
    return self.value == other.value;
}

- (BOOL)isLesserThan:(EFCCard *)other
{
    return ![self isGreaterThan:other];
}

- (NSString *)description
{
    NSUInteger card = self.value;
    if (card < 11) {
        return [NSString stringWithFormat:@"%lu", (unsigned long)card];
    }

    if (card == 11) {
        return @"Jack";
    }

    if (card == 12) {
        return @"Queen";
    }

    if (card == 13) {
        return @"King";
    }

    if (card == 14) {
        return @"Ace";
    }

    return @"";
}

@end