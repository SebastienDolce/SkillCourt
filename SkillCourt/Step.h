//
//  Step.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/15/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GridCommand.h"

@interface Step : NSObject

@property (assign) long theDuration, theInterval;
@property (strong, nonatomic) NSMutableArray<GridCommand*> *tileCommands;
-(void) setTileCommands:(NSMutableArray<GridCommand *> *)Commands;
-(id) init;
-(id) init : (long) theDuration :(int) theInterval;;

@end
