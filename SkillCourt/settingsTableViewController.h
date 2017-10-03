//
//  settingsTableViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/4/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingsTableViewController : UITableViewController
- (IBAction)pressedLogout:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *coachModeSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *saveUserSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *percentageSwitch;

@end
