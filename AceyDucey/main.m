//
//  main.m
//  AceyDucey
//
//  Created by Giordano Scalzo on 27/02/2014.
//  Copyright (c) 2014 Giordano Scalzo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EFCGame.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        EFCGame *game = [EFCGame new];
        [game play];
        
    }
    return 0;
}

