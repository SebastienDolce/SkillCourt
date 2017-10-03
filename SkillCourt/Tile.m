//
//  Tile.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/11/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "Tile.h"

@implementation Tile
@synthesize R, G, B;

-(id) init
{
    if (self = [super init])
    {
        self.R = 0;
        self.G = 0;
        self.B = 0;
    }
    return self;
}

-(void) setColor : (int*) red : (int*) green :  (int*) blue
{
    if (R<0 || G<0 || B<0 || R>255 ||G>255 ||B>255)
    {
        
    }
    else
    {
        self.R =*(red);
        self.G=*(green);
        self.B=*(blue);
    }
}

-(void) zeroOut
{
    self.R=0;
    self.G=0;
    self.B=0;
}

-(NSString*) interpreter
{
    if (R ==0 && G ==0 && B == 0)
        return @"X";
    else if (R ==255 && G ==0 && B == 0)
        return @"R";
    else if (R ==0 && G ==255 && B == 0)
        return @"G";
    else if (R ==0 && G ==0 && B == 255)
        return @"B";
    else if (R ==255 && G ==255 && B == 0)
        return @"Y";
    return @"O";
}
@end
