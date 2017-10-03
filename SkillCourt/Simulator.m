//
//  Simulator.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "Simulator.h"

@implementation Simulator
@synthesize info,grids,steps;


-(id) init : (SequenceFile *) input
{
    if (self = [super init])
    {
        BOOL fileLoad = FALSE;
        steps = [[NSMutableArray<Step *> alloc] init];
        info = [[NSMutableDictionary alloc] init];
        grids = [[NSMutableDictionary alloc] init];
        info = input.info;
       // grids = input.grids;
        steps = input.steps;
        for (GridInfo *i in input.grids)
        {
           TileGrid *tg = [[TileGrid alloc] init : i.gridName : i.rows : i.cols];
            [self.grids setObject: tg forKey: i.gridName];
        }
        fileLoad = TRUE;
    }
    return self;
}

-(void) loadFile : (SequenceFile*) input
{
    BOOL fileLoad = FALSE;
    steps = [[NSMutableArray<Step *> alloc] init];
    info = [[NSMutableDictionary alloc] init];
    grids = [[NSMutableDictionary alloc] init];

    info = input.info;
    // grids = input.grids;
    steps = input.steps;
    for (GridInfo *i in input.grids)
    {
        TileGrid *tg = [[TileGrid alloc] init : i.gridName : i.rows : i.cols];
        [self.grids setObject: tg forKey: i.gridName];
    }
    fileLoad = TRUE;

}
-(void) runSimulation
{
    
}
@end
