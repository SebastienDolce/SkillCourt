//
//  TeamManagementTableViewCell.h
//  SkillCourt
//
//  Created by sebastien dolce on 2/27/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamManagementTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UIImageView *myImage2;

@end
