//
//  GridCommand.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/11/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "GridCommand.h"

@implementation GridCommand
@synthesize  gridName, theRow, theCol, R, G, B, ID;

-(id) init
{
    if (self = [super init])
    {
        self.gridName = @"DefaultGrid";
        self.theRow = -1;
        self.theCol = -1;
        self.R = -1;
        self.G = -1;
        self.B = -1;
        self.ID = -1;
    }
    return self;
}

-(id) init: (NSString *) theName : (int) theRows :(int) theCols : (int) theR :(int) theG : (int) theB :(int) theID
{
    if (self = [super init])
    {
        if (theRows<0 || theCols<0)
        {
            
        }
        else
        {
            self.gridName = gridName;
            self.theRow = theRows;
            self.theCol = theCols;
            self.R = theR;
            self.G = theG;
            self.B = theB;
            self.ID = theID;
        }
    }
    return self;
}


@end
