//
//  ManageDrillsTableViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 1/29/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridInfo.h"
#import "StepTableViewController.h"
#import "SequenceList.h"
#import "AddDrillViewController.h"

@interface ManageDrillsTableViewController : UITableViewController

@property (strong, nonatomic) GridInfo* myInfo;
@property (strong, nonatomic) NSMutableArray* drilNames;
@property (strong, nonatomic) SequenceList* sequenceList;
- (IBAction)pressedAddDrill:(id)sender;

@end
