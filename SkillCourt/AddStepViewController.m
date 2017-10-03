//
//  AddStepViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "AddStepViewController.h"

@interface AddStepViewController ()

@end

@implementation AddStepViewController
@synthesize theStep , theCommand, theSteps, padRowField, padColField, durationField, intervalField, thegrid,rowPicker, colPicker, theNumbers, sequenceList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    sequenceList = [SequenceList sharedList];
    theNumbers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    
    self.rowPicker.delegate = self;
    self.rowPicker.dataSource = self;
    [self.rowPicker reloadAllComponents];
    
    self.colPicker.delegate = self;
    self.colPicker.dataSource = self;
    [self.colPicker reloadAllComponents];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //GridInfo *myInfo = [[GridInfo alloc] init : drillName.text : [rows.text intValue] : [cols.text intValue] ];
    if ([segue.identifier isEqualToString:@"backstep"])
    {
        theCommand = [[GridCommand alloc] init:[NSString stringWithFormat:@"%lu",(unsigned long)[theSteps count]] :[padField.text intValue] :[padField.text intValue] :0 :255 :0 :[theSteps count]];
        Step *mystep = [[Step alloc] init: [durationField.text intValue] : [intervalField.text intValue] ];
      //  [mystep setTileCommands:<#(NSMutableArray<GridCommand *> *)#>]
        //GridCommand *mycommand = [[GridCommand alloc] init: @"default" : 0 :255 :0 ];
        StepTableViewController *controller = (StepTableViewController *) segue.destinationViewController;
        //controller.myInfo = myInfo;
        controller.theStep = mystep;
        controller.theCommand = theCommand;
    }
}*/
- (IBAction)pressedAdd:(id)sender
{
    theCommand = [[GridCommand alloc] init:[NSString stringWithFormat:@"%lu",(unsigned long)[theSteps count]] :[[theNumbers objectAtIndex:[rowPicker selectedRowInComponent:0]] intValue] :[[theNumbers objectAtIndex:[colPicker selectedRowInComponent:0]] intValue] :0 :255 :0 :[theSteps count]];
    Step *mystep = [[Step alloc] init: [durationField.text intValue] : [intervalField.text intValue] ];
    //StepTableViewController *secondViewController = [[StepTableViewController alloc] init];
  StepTableViewController *secondViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"stepsTable"];
    //secondViewController.thePad = padField.text;
    //secondViewController.theStep = mystep;
    [sequenceList.theSteps addObject:mystep];
    [sequenceList.theCommands addObject:theCommand];
  //  secondViewController.theCommand = theCommand;// Set the exposed property
   //[self.navigationController pushViewController:secondViewController animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 9;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (row == 0)
        return @"1";
    else if(row == 1)
        return @"2";
    else if(row == 2)
        return @"3";
    else if(row == 3)
        return @"4";
    else if(row == 4)
        return @"5";
    else if(row == 5)
        return @"6";
    else if(row == 6)
        return @"7";
    else if(row == 7)
        return @"8";
    else if(row == 8)
        return @"9";
    return @"1";
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [durationField resignFirstResponder];
    [intervalField resignFirstResponder];
    //[coachFeild resignFirstResponder];
    
   // [userNameField resignFirstResponder];
    
    
    //userInput.text = userMessage;
    [super touchesBegan:touches withEvent:event];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [durationField resignFirstResponder];
    [intervalField resignFirstResponder];
    //[coachFeild resignFirstResponder];
    
  //  [userNameField resignFirstResponder];
    
    
    
    return TRUE;
}


@end
