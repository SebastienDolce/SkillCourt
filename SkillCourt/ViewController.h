//
//  ViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 1/26/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)pressedLogin:(id)sender;
- (IBAction)pressedRegister:(id)sender;
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;


@end

