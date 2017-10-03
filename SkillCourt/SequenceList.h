//
//  SequenceList.h
//  SkillCourt
//
//  Created by sebastien dolce on 5/1/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Step.h"
#import "GridCommand.h"
#import "GridInfo.h"
#import <Parse/Parse.h>

@interface SequenceList : NSObject

@property (strong, nonatomic) NSMutableArray *theCommands;
@property (strong, nonatomic) NSMutableArray *theSteps;
@property (strong, nonatomic) NSMutableArray *theSequence;
@property (strong, nonatomic) NSMutableArray *theInfo;
@property (strong, nonatomic) NSMutableArray *theUsers;
- (void) addGrid : (GridInfo*) theGrid;


- (void) addStep: (Step*) theStep;


- (void) addCommand : (GridCommand*) theCommand;
-(void) addUser : (PFUser *) user;

+(id) sharedList;
@end
