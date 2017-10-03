//
//  ProfileViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 2/27/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *firstNameField;
@property (strong, nonatomic) IBOutlet UILabel *lastNameField;
@property (strong, nonatomic) IBOutlet UILabel *phoneField;
@property (strong, nonatomic) IBOutlet UILabel *emailField;
@property (strong, nonatomic) IBOutlet UILabel *positionField;
@property (strong, nonatomic) IBOutlet UILabel *prefferedFootField;
@property (strong, nonatomic) IBOutlet UILabel *ageField;


@property (strong, nonatomic) IBOutlet UIImageView *myImage;
- (IBAction)pressedEdit:(id)sender;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end
