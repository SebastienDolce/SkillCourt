//
//  ViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 1/26/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "RegisterViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize userNameTextField, passwordTextField,loginButton,registerButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    loginButton.layer.cornerRadius = 10;
    loginButton.layer.borderWidth = 1.5;
    loginButton.clipsToBounds = YES;
    loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    registerButton.layer.cornerRadius = 10;
    registerButton.layer.borderWidth = 1.5;
    registerButton.clipsToBounds = YES;
    registerButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
  //  self.navigationItem.leftBarButtonItem = nil;
    //self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedLogin:(id)sender
{
    
    [PFUser logInWithUsernameInBackground:userNameTextField.text password:passwordTextField.text block:^(PFUser *user, NSError *error)
     {
         if (!error)
         {
             [self performSegueWithIdentifier:@"loginSegue" sender:nil];
             //UIAlertView *loginSuccess = [[UIAlertView alloc] initWithTitle: @"success" message: @"u logged in" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            // [loginSuccess show];

         }
         else
         {
             UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"error" message: @"login failed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [loginFailure show];

         }
     }];
    
     }

- (IBAction)pressedRegister:(id)sender
{
   // UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
  //  RegisterViewController *regView = [board instantiateViewControllerWithIdentifier:@"registerView"];
   // [self.navigationController pushViewController:regView animated:YES];
  // RegisterViewController *countview = [self.storyboard instantiateViewControllerWithIdentifier:@"registerView"];
    //[self.navigationController pushViewController:controller animated:YES];
   // countview.myItem = item;
  //  [self.navigationController pushViewController:countview animated:YES];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [userNameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    //userInput.text = userMessage;
    [super touchesBegan:touches withEvent:event];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    
    [userNameTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    
    return TRUE;
}

@end
