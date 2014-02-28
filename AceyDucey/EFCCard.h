//
// Created by Giordano Scalzo on 28/02/2014.
// Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EFCCard : NSObject

+ (EFCCard *)cardValue:(NSUInteger)value;

- (BOOL)isGreaterThan:(EFCCard *)other;
- (BOOL)isLesserThan:(EFCCard *)other;

- (BOOL)isInsideCard:(EFCCard *)firstCard andCard:(EFCCard *)secondCard;

@end