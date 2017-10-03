//
//  AddStepViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepTableViewController.h"
#import "GridCommand.h"
#import "Step.h"
#import "GridInfo.h"
#import "SequenceList.h"

@interface AddStepViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *padRowField;
@property (strong, nonatomic) IBOutlet UITextField *durationField;
@property (strong, nonatomic) IBOutlet UITextField *intervalField;
@property (strong, nonatomic) Step *theStep;
@property (strong, nonatomic) GridCommand *theCommand;
@property (strong, nonatomic) NSMutableArray *theSteps;
@property (strong, nonatomic) GridInfo *thegrid;
- (IBAction)pressedAdd:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *padColField;
@property (strong, nonatomic) IBOutlet UIPickerView *rowPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *colPicker;
@property (strong, nonatomic) NSArray *theNumbers;
@property (strong, nonatomic) SequenceList* sequenceList;

@end
