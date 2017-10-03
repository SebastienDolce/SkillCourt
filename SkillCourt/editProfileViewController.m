//
//  editProfileViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/30/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "editProfileViewController.h"

@interface editProfileViewController ()

@end

@implementation editProfileViewController

@synthesize firstNameField,lastNameField,phoneField, datePicker, positionPicker, coachField,rightButton,leftButton, positions;
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    leftButton.layer.cornerRadius = 10;
    leftButton.layer.borderWidth = 1.5;
    leftButton.clipsToBounds = YES;
    leftButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    rightButton.layer.cornerRadius = 10;
    rightButton.layer.borderWidth = 1.5;
    rightButton.clipsToBounds = YES;
    rightButton.layer.borderColor = [UIColor whiteColor].CGColor;

    
    // Do any additional setup after loading the view.
    PFUser *theUser = [PFUser currentUser];
    firstNameField.text = [theUser objectForKey:@"firstName"];
    lastNameField.text = [theUser objectForKey:@"lastName"];
    phoneField.text = [theUser objectForKey:@"phone"];
    

    positions = [[NSArray alloc] initWithObjects:@"Coach", @"LB", @"CB", @"RB", @"LWB", @"RWB", @"CDM", @"CM", @"LM", @"RM", @"CAM", @"CF", @"LF", @"RF", @"LW", @"RW", @"ST", @"GK", nil];
    
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //leftButton.enabled = NO;
    coachField = @"Right";
    datePicker = [[UIDatePicker alloc] init];
    
    self.positionPicker.delegate = self;
    self.positionPicker.dataSource = self;
    [self.positionPicker reloadAllComponents];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [firstNameField resignFirstResponder];
    [lastNameField resignFirstResponder];
   
    //[coachFeild resignFirstResponder];
    [lastNameField resignFirstResponder];
    
    [phoneField resignFirstResponder];
    
    //userInput.text = userMessage;
    [super touchesBegan:touches withEvent:event];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [firstNameField resignFirstResponder];
    [lastNameField resignFirstResponder];
    
    //[coachFeild resignFirstResponder];
    [lastNameField resignFirstResponder];
    
    [phoneField resignFirstResponder];
    
    
    
    return TRUE;
}




- (IBAction)pressedRight:(id)sender
{
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    coachField = @"Right";
    
    // rightButton.enabled = NO;
    //  leftButton.enabled = YES;
}

- (IBAction)pressedLeft:(id)sender
{
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    coachField = @"Left";
    //rightButton.enabled = NO;
    // leftButton.enabled = YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 18;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (row == 0)
        return @"Coach";
    else if(row == 1)
        return @"LB";
    else if(row == 2)
        return @"CB";
    else if(row == 3)
        return @"RB";
    else if(row == 4)
        return @"LWB";
    else if(row == 5)
        return @"RWB";
    else if(row == 6)
        return @"CDM";
    else if(row == 7)
        return @"CM";
    else if(row == 8)
        return @"LM";
    else if(row == 9)
        return @"RM";
    else if(row == 10)
        return @"CAM";
    else if(row == 11)
        return @"CF";
    else if(row == 12)
        return @"LF";
    else if(row == 13)
        return @"RF";
    else if(row == 14)
        return @"LW";
    else if(row == 15)
        return @"RW";
    else if(row == 16)
        return @"ST";
    else if(row == 17)
        return @"GK";
    return @"GK";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressedUpdate:(id)sender {
    if ([firstNameField.text isEqual:@""]||[lastNameField.text isEqual:@""])
    {
        UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"error" message: @"enter required info" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [loginFailure show];
    }
    else
    {
        
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone localTimeZone]];
        [formatter setDateFormat:@"MMM dd, yyyy"];
        
        PFUser *user = [PFUser currentUser];
        [user setObject:phoneField.text forKey:@"phone"];
        [user setObject:firstNameField.text forKey:@"firstName"];
        [user setObject:lastNameField.text forKey:@"lastName"];
        [user setObject:datePicker.date forKey:@"birthDate"];
        [user setObject:coachField forKey:@"preferredFoot"];
        
        
        [user setObject:[positions objectAtIndex:[positionPicker selectedRowInComponent:0]] forKey:@"position"];
        //BOOL x;
        // user[@"birthDate"] = [NSString stringWithFormat:@"%@", [formatter stringFromDate:datePicker.date]];
        if ([[positions objectAtIndex:[positionPicker selectedRowInComponent:0]]  isEqual: @"Coach"])
            [user setObject:@YES forKey:@"coach"];
        else
            [user setObject:@NO forKey:@"coach"];
        
        UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"Update" message: @"Profile updated successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [loginFailure show];
        
        /*
         [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         {
         if (error)
         {
         UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"error" message: @"error saving info" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [loginFailure show];
         
         }
         else
         {
         UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"success" message: @"saved info" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
         [loginFailure show];
         
         }
         }];*/
        
    }

}
@end
