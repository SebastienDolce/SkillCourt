//
//  TileGrid.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/15/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"
#import "GridCommand.h"
#import "Step.h"

@interface TileGrid : NSObject


@property (strong, nonatomic) NSMutableArray *grid;
@property (strong, nonatomic) NSMutableArray<Tile*> *row;
@property (strong, nonatomic) NSString *name;
@property (assign) int rows, cols;
- (void) takeCommand: (GridCommand*) i;
-(void) takeStep: (Step *) step;
- (void) zeroOut;
-(id) init: (NSString *) theName : (int) theRows :(int) theCols;
-(id) init;

@end
