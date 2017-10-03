//
//  GridInfo.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/11/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "GridInfo.h"

@implementation GridInfo
@synthesize rows, cols, gridName;

-(id) init
{
    if (self = [super init])
    {
        self.gridName = @"Default Name";
        self.rows = -1;
        self.cols = -1;
    }
    return self;
}

-(id) init: (NSString *) theName : (int) theRows :(int) theCols
{
    if (self = [super init])
    {
        self.gridName = theName;
        self.rows = theRows;
        self.cols = theCols;
    }
    return self;
}


@end
