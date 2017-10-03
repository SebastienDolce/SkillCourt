//
//  AddDrillViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridInfo.h"
#import "ManageDrillsTableViewController.h"

@interface AddDrillViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *drillName;
@property (strong, nonatomic) IBOutlet UITextField *rows;
@property (strong, nonatomic) IBOutlet UITextField *cols;
@property (strong, nonatomic) IBOutlet UIPickerView *rowPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *colPicker;
@property (strong, nonatomic) NSArray *theNumbers;
@property (strong, nonatomic) SequenceList* sequenceList;
@property (strong, nonatomic) IBOutlet UIButton *addGridButton;
- (IBAction)pressedAddGrid:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (strong, nonatomic) NSMutableArray *theGrids;
@end
