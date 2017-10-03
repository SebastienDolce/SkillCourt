//
//  TeamsManagementTableViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 5/2/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamManagementTableViewCell.h"
#import <Parse/Parse.h>
#import "SequenceList.h"
#import "PlayerTableViewController.h"


@interface TeamsManagementTableViewController : UITableViewController
- (IBAction)pressedAdd:(id)sender;

@property (strong, nonatomic) SequenceList *seq;
@property (strong, nonatomic) PFUser *player;
@end
