//
//  editProfileViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/30/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ProfileViewController.h"

@interface editProfileViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;

@property (strong, nonatomic) IBOutlet UITextField *phoneField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet UIPickerView *positionPicker;



@property (strong, nonatomic) NSString *coachField;
- (IBAction)pressedRight:(id)sender;
- (IBAction)pressedLeft:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
- (IBAction)pressedUpdate:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet NSArray *positions;
@end
