//
//  RegisterViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 1/29/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize userNameField,passwordField,emailField, cancelButton, registerButton;

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    cancelButton.layer.cornerRadius = 10;
    cancelButton.layer.borderWidth = 1.5;
    cancelButton.clipsToBounds = YES;
    cancelButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    registerButton.layer.cornerRadius = 10;
    registerButton.layer.borderWidth = 1.5;
    registerButton.clipsToBounds = YES;
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;

    // Do any additional setup after loading the view.
    

    
    
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


- (IBAction)pressedRegister:(id)sender
{
    if ([userNameField.text isEqual:@""]||[passwordField.text isEqual:@""]||[emailField.text isEqual:@""])
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


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
    //[coachFeild resignFirstResponder];
    
    [userNameField resignFirstResponder];
   
    
    //userInput.text = userMessage;
    [super touchesBegan:touches withEvent:event];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
        [emailField resignFirstResponder];
    [passwordField resignFirstResponder];
    //[coachFeild resignFirstResponder];
   
    [userNameField resignFirstResponder];
        
    
    
    return TRUE;
}

@end
