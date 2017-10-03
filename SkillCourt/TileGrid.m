//
//  TileGrid.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/15/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "TileGrid.h"

@implementation TileGrid
@synthesize grid, name, rows, row, cols;


-(id) init
{
    if (self = [super init])
    {
        rows =-1;
        cols =-1;
        self.name = @"default";
        grid = [[NSMutableArray alloc] initWithCapacity:1];
        row= [[NSMutableArray<Tile*> alloc] initWithCapacity:1];
        Tile *row2 = [[Tile alloc] init];
        [row addObject:row2];
        [grid addObject:row];
        
        for (int j = 0; j<[[grid objectAtIndex:0] count] ; j++)
        {
            for (int i = 0; i<[grid count] ; i++)
            {
               // NSMutableArray *rrow = [[grid objectAtIndex:i ] objectAtIndex:j];
                NSMutableArray *row1 =[grid objectAtIndex:i ];
                Tile *row2 =[row1 objectAtIndex:j ];
                row2 = [[Tile alloc] init];
            }
        }
    }
    return self;
}

-(id) init: (NSString *) theName : (int) theRows :(int) theCols
{
    if (self = [super init])
    {
        self.rows = theRows;
        self.cols = theCols;
        self.name = @"default";
        grid = [[NSMutableArray alloc] initWithCapacity:rows];
        row= [[NSMutableArray alloc] initWithCapacity:cols];
        Tile *row2 = [[Tile alloc] init];
        [row addObject:row2];
        [grid addObject:row];
        
        for (int j = 0; j<[[grid objectAtIndex:0] count] ; j++)
        {
            for (int i = 0; i<[grid count] ; i++)
            {
                //Tile *row2 =[row1 objectAtIndex:j ];
                //Tile *row2 = [[Tile alloc] init];
               //[[grid objectAtIndex:i ]  addObject:row2] ;

                // NSMutableArray *rrow = [[grid objectAtIndex:i ] objectAtIndex:j];
               // NSMutableArray *row1 =[grid objectAtIndex:i ];
               // Tile *row2 =[row1 objectAtIndex:j ];
               // row2 = [[Tile alloc] init];
            }
        }

    }
    return self;
}



- (void) zeroOut
{
    for (int j = 0; j<[[grid objectAtIndex:0] count] ; j++)
    {
        for (int i = 0; i<[grid count] ; i++)
        {
            // NSMutableArray *rrow = [[grid objectAtIndex:i ] objectAtIndex:j];
            NSMutableArray *row1 =[grid objectAtIndex:i ];
            Tile *row2 =[row1 objectAtIndex:j ];
            row2 = [[Tile alloc] init];
        }
    }
    
}

-(void) takeStep: (Step *) step
{
    NSMutableArray<GridCommand *> *commands = [step tileCommands];
    if ([commands count] != 0)
    {
        for (GridCommand *i in commands)
        {
            [[[grid objectAtIndex:i.theRow ] objectAtIndex:i.theCol] setColor:i.R :i.G :i.B];
        }
    }
        
    //[[NSMutableArray<GridCommand *> alloc] init];
}


- (void) takeCommand: (GridCommand*) i
{
    [[[grid objectAtIndex:i.theRow ] objectAtIndex:i.theCol] setColor:i.R :i.G :i.B];
   // Tile *rr = [[grid objectAtIndex:i.row ] objectAtIndex:i.col] ;
   // [rr setColor:(int*) i.R : (int*) i.G : (int*) i.B];
   // [rr setColor: i.R, i.G, i.B];
    //Tile *row2 = [[Tile alloc] init];
    //row2 =[[[grid objectAtIndex:i.row ] objectAtIndex:i.col] ;
    //[[[grid objectAtIndex:i.row ] objectAtIndex:i.col] setColor: i.R, i.G, i.B];
}

@end
