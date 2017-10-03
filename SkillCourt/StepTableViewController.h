//
//  StepTableViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridInfo.h"
#import "Step.h"
#import "AddStepViewController.h"
#import "GridCommand.h"
#import "StepsTableViewCell.h"
#import "SequenceFile.h"
#import "SequenceList.h"

@interface StepTableViewController : UITableViewController

@property (strong, nonatomic) GridInfo *thegrid;
@property (strong, nonatomic) Step *theStep;
@property (strong, nonatomic) NSMutableArray *theSteps;
@property (strong, nonatomic) GridCommand *theCommand;
@property (strong, nonatomic) NSMutableArray *theCommands;
@property (strong, nonatomic) NSMutableArray *myarr1;
@property (strong, nonatomic) NSMutableArray *myarr2;
@property (strong, nonatomic) SequenceList *sequenceList;
@property (assign) int stepNumber;
//@property (strong, nonatomic) NSString *theDuration, *thePad, *theInterval;
- (IBAction)pressedCreate:(id)sender;

@property (strong, nonatomic) NSMutableArray *myarr3;

@end
