//
//  Step.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/15/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "Step.h"

@implementation Step

@synthesize theInterval,theDuration,tileCommands;

-(id) init
{
    if (self = [super init])
    {
        theDuration = -1L;
        theInterval = -1L;
        tileCommands = [[NSMutableArray<GridCommand*> alloc] init];
    }
    return self;
}

-(id) init : (long) theDurations :(int) theIntervals
{
    if (self = [super init])
    {
        self.theDuration =theDurations;
        self.theInterval = theIntervals;
        tileCommands = [[NSMutableArray<GridCommand*> alloc] init];
    }
    return self;
}

-(void) setTileCommands:(NSMutableArray<GridCommand *> *)Commands
{
    tileCommands = Commands;
}

@end
