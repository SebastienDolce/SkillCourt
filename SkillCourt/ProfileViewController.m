//
//  ProfileViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 2/27/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize myImage, imagePicker, firstNameField, lastNameField, phoneField, emailField, prefferedFootField, ageField, positionField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myImage.layer.cornerRadius = self.myImage.frame.size.width / 2;
    self.myImage.clipsToBounds = YES;
    self.myImage.layer.borderWidth = 3.0f;
    self.myImage.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    PFUser *user = [PFUser currentUser];
    PFFile *theImage =[user objectForKey:@"image"];
    NSData *imageData = [theImage getData];
    if (imageData!=NULL)
        myImage.image = [UIImage imageWithData:imageData];
    else
        myImage.image = [UIImage imageNamed:@"team-placeholder.jpg"];
    
    firstNameField.text = [user objectForKey:@"firstName"];
    lastNameField.text = [user objectForKey:@"lastName"];
    phoneField.text = [user objectForKey:@"phone"];
    emailField.text = [user objectForKey:@"email"];
    positionField.text = [user objectForKey:@"position"];
   // ageField.text = [user objectForKey:@"birthDate"];
    prefferedFootField.text = [user objectForKey:@"preferredFoot"];
    
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

- (IBAction)pressedEdit:(id)sender
{
    imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    
    [self presentModalViewController:imagePicker animated:YES];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    myImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissModalViewControllerAnimated:YES];
    NSData *imageData = UIImagePNGRepresentation(myImage.image);
    PFFile *imageFile = [PFFile fileWithData:UIImageJPEGRepresentation(myImage.image, 1.0)];
    //PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (error)
         {
             UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"error" message: @"error saving photo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [loginFailure show];
             
         }
         else
         {
             UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"success" message: @"saved photo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [loginFailure show];
             
         }
     }];

    //[imageFile saveInBackground];
    
    PFUser *user = [PFUser currentUser];
    [user setObject:imageFile forKey:@"image"];
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
     {
         if (error)
         {
             UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"error" message: @"error saving photo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [loginFailure show];
             
         }
         else
         {
             UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"success" message: @"saved photo" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [loginFailure show];
             
         }
     }];

    //[user saveInBackground];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
    
}

@end
