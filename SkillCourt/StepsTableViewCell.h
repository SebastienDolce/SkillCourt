//
//  StepsTableViewCell.h
//  SkillCourt
//
//  Created by sebastien dolce on 4/28/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StepsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *stepNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *padLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationLabel;
@property (strong, nonatomic) IBOutlet UILabel *intervalLabel;

@end
