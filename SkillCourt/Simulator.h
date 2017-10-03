//
//  Simulator.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Step.h"
#import "SequenceFile.h"
#import "GridInfo.h"
#import "TileGrid.h"

@interface Simulator : NSObject

@property (strong, nonatomic) NSMutableDictionary *info;
@property (strong, nonatomic) NSMutableArray<Step*> *steps;
@property (strong, nonatomic) NSMutableDictionary<id,id> *grids;
-(id) init : (SequenceFile *) input;
-(void) loadFile : (SequenceFile*) input;
-(void) runSimulation;


@end
