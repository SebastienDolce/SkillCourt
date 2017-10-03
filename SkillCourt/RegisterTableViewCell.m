//
//  RegisterTableViewCell.m
//  SkillCourt
//
//  Created by sebastien dolce on 1/26/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "RegisterTableViewCell.h"
#import "AppDelegate.h"


@implementation RegisterTableViewCell
@synthesize firstNameField,lastNameField,userNameField,passwordField,emailField,phoneField, datePicker, positionPicker, coachField,rightButton,leftButton, positions;
+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)awakeFromNib
{
    
 //  NSArray *positionsb = [[[NSArray alloc] initWithObjects:@"LB", @"CB", @"RB", @"LWB", @"RWB", @"CDM", @"CM", @"LM", @"RM", @"CAM", @"CF", @"LF", @"RF", @"LW", @"RW", @"ST", @"GK" , nil] ;
    positions = [[NSArray alloc] initWithObjects:@"Coach", @"LB", @"CB", @"RB", @"LWB", @"RWB", @"CDM", @"CM", @"LM", @"RM", @"CAM", @"CF", @"LF", @"RF", @"LW", @"RW", @"ST", @"GK", nil];
                          
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //leftButton.enabled = NO;
    coachField = @"Right";
    datePicker = [[UIDatePicker alloc] init];
        // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [firstNameField resignFirstResponder];
    [lastNameField resignFirstResponder];
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
    //[coachFeild resignFirstResponder];
    [lastNameField resignFirstResponder];
    [userNameField resignFirstResponder];
    [phoneField resignFirstResponder];

    //userInput.text = userMessage;
    [super touchesBegan:touches withEvent:event];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [firstNameField resignFirstResponder];
    [lastNameField resignFirstResponder];
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
    //[coachFeild resignFirstResponder];
    [lastNameField resignFirstResponder];
    [userNameField resignFirstResponder];
    [phoneField resignFirstResponder];


    
    return TRUE;
}



- (IBAction)pressedRegister:(id)sender
{
    if ([firstNameField.text isEqual:@""]||[userNameField.text isEqual:@""]||[lastNameField.text isEqual:@""]||[passwordField.text isEqual:@""])
    {
        UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"error" message: @"enter required info" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [loginFailure show];
    }
    else
    {
    
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone:[NSTimeZone localTimeZone]];
        [formatter setDateFormat:@"MMM dd, yyyy"];
        
        PFUser *user = [PFUser user];
        user.username = userNameField.text;
        user.password = passwordField.text;
        user.email = emailField.text;
        user[@"phone"] = phoneField.text;
        user[@"firstName"] = firstNameField.text;
        user[@"lastName"] = lastNameField.text;
        user[@"birthDate"] = datePicker.date;
        user[@"lastName"] = lastNameField.text;
         user[@"preferredFoot"] = coachField;
        user[@"position"] = [positions objectAtIndex:[positionPicker selectedRowInComponent:0]];
        //BOOL x;
       // user[@"birthDate"] = [NSString stringWithFormat:@"%@", [formatter stringFromDate:datePicker.date]];
        if ([[positions objectAtIndex:[positionPicker selectedRowInComponent:0]]  isEqual: @"Coach"])
            user[@"isCoach"] = @YES;
        else
           user[@"isCoach"] = @NO;
        
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
         }];
        
    }
}
- (IBAction)pressedRight:(id)sender
{
    [leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[RegisterTableViewCell colorFromHexString:@"FFFFFF"] forState:UIControlStateNormal];    coachField = @"Right";
   // rightButton.enabled = NO;
  //  leftButton.enabled = YES;
}

- (IBAction)pressedLeft:(id)sender
{
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftButton setTitleColor:[RegisterTableViewCell colorFromHexString:@"FFFFFF"] forState:UIControlStateNormal];
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

@end
