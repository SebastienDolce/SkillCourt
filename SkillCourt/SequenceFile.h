//
//  SequenceFile.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GridInfo.h"
#import "Step.h"

@interface SequenceFile : NSObject

@property (strong, nonatomic) NSMutableDictionary *info;
@property (strong, nonatomic) NSMutableArray<GridInfo*> *grids;
@property (strong, nonatomic) NSMutableArray<Step*> *steps;
-(void) exportFile : (NSString*) filename;
-(id) init : (NSMutableDictionary*) theInfo :(NSMutableArray*) theGrid : (NSMutableArray*) theStep;
-(id) init;
@end
