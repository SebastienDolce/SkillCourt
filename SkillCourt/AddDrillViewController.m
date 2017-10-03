//
//  AddDrillViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "AddDrillViewController.h"

@interface AddDrillViewController ()

@end

@implementation AddDrillViewController
@synthesize drillName, rows,cols, rowPicker, colPicker, theNumbers,sequenceList,theGrids,myTable,addGridButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    myTable.layer.cornerRadius = 10;
    myTable.layer.borderWidth = 1.5;
    myTable.clipsToBounds = YES;
    myTable.layer.borderColor = [UIColor whiteColor].CGColor;
    sequenceList = [SequenceList sharedList];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
      target:self
      action:@selector(Add:)];
    theGrids = [[NSMutableArray alloc] init];
    theNumbers = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    
    self.rowPicker.delegate = self;
    self.rowPicker.dataSource = self;
    [self.rowPicker reloadAllComponents];
    
    self.colPicker.delegate = self;
    self.colPicker.dataSource = self;
    [self.colPicker reloadAllComponents];
    
    
    myTable.delegate = self;
    myTable.dataSource = self;

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
-(IBAction)Add:(id)sender
{
    //GridInfo *myInfo = [[GridInfo alloc] init : drillName.text : [rows.text intValue] : [cols.text intValue] ];
    GridInfo *myInfo = [[GridInfo alloc] init : drillName.text : [[theNumbers objectAtIndex:[rowPicker selectedRowInComponent:0]] intValue] : [[theNumbers objectAtIndex:[colPicker selectedRowInComponent:0]] intValue] ];
    
           // ManageDrillsTableViewController *controller = (ManageDrillsTableViewController *) segue.destinationViewController;
        //ManageDrillsTableViewController *secondViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"drillsTable"];
        //secondViewController.thePad = padField.text;
    [theGrids addObject:myInfo];
    //[sequenceList.theInfo addObject:myInfo];
    [myTable reloadData];
    [sequenceList.theInfo addObject:theGrids];
      //secondViewController.myInfo = myInfo;
        //[self.navigationController pushViewController:secondViewController animated:YES];
        //controller.myInfo = myInfo;
        
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


- (IBAction)pressedAddGrid:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Event" message:@"Enter a name for the Event" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // The user created a new item, add it
    if (buttonIndex == 1)
    {
        
        [sequenceList.theInfo addObject: [[alertView textFieldAtIndex:0] text]];
        
        // Get the input text
        //NSString *newItem = [[alertView textFieldAtIndex:0] text];
        //[myTableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    //return [theSteps count];
    return [theGrids count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gridTable" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [theGrids [indexPath.row] gridName];
    return cell;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [drillName resignFirstResponder];
    //[padColField resignFirstResponder];
    //[coachFeild resignFirstResponder];
    
    // [userNameField resignFirstResponder];
    
    
    //userInput.text = userMessage;
    [super touchesBegan:touches withEvent:event];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [drillName resignFirstResponder];
   // [padColField resignFirstResponder];
    //[coachFeild resignFirstResponder];
    
    //  [userNameField resignFirstResponder];
    
    
    
    return TRUE;
}



@end
