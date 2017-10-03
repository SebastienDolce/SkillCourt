//
//  PlayerTableViewController.h
//  SkillCourt
//
//  Created by sebastien dolce on 5/2/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "TeamManagementTableViewCell.h"
#import "PlayerTableViewController.h"
#import "TeamsManagementTableViewController.h"
#import "SequenceList.h"

@interface PlayerTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* players;
@property (strong, nonatomic) PFUser* player;
@property (strong, nonatomic) NSMutableArray* checkOn;
@property (strong, nonatomic) SequenceList *theList;
@end
