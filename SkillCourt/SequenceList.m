//
//  SequenceList.m
//  SkillCourt
//
//  Created by sebastien dolce on 5/1/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "SequenceList.h"

@implementation SequenceList
@synthesize theCommands,theSteps, theInfo, theUsers, theSequence;
/*
+ (instancetype) sharedList
{
    static SequenceList *sharedSequenceList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{sharedSequenceList = [[self alloc] init];
    });
    return sharedSequenceList;
}
*/

+ (instancetype) sharedList
{
    static SequenceList* SharedList = nil;
    if (!SharedList)
    {
        SharedList = [[SequenceList alloc] init];
    }
    return SharedList;
}

-(instancetype) init
{
    if (self = [super init])
    {
        theCommands = [[NSMutableArray alloc] init];
        theInfo = [[NSMutableArray alloc] init];
        theSteps= [[NSMutableArray alloc] init];
        theUsers = [[NSMutableArray alloc] init];
        theSequence = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void) addGrid : (GridInfo*) theGrid
{
    [theInfo addObject: theGrid];
}

- (void) addStep: (Step*) theStep
{
    [theSteps addObject: theStep];
}
-(void) addUser : (PFUser *) user
{
    [theUsers addObject:user];
}

- (void) addCommand : (GridCommand*) theCommand
{
    [theCommands addObject: theCommand];
}

@end
