//
//  RegisterTableViewCell.h
//  SkillCourt
//
//  Created by sebastien dolce on 1/26/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface RegisterTableViewCell : UITableViewCell <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *userNameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *phoneField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (strong, nonatomic) IBOutlet UIPickerView *positionPicker;


- (IBAction)pressedRegister:(id)sender;
@property (strong, nonatomic) NSString *coachField;
- (IBAction)pressedRight:(id)sender;
- (IBAction)pressedLeft:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;

@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet NSArray *positions;
@end
