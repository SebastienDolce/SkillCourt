//
//  TeamsManagementTableViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 5/2/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "TeamsManagementTableViewController.h"

@interface TeamsManagementTableViewController ()

@end

@implementation TeamsManagementTableViewController
@synthesize seq, player;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"skillcourt Background.png"]];
    seq = [SequenceList sharedList];
    if ([seq.theUsers count] == 0)
        [seq addUser:[PFUser currentUser]];
   // if (player !=nil)
  //  {
  //      [seq addUser:player];
  //  }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [seq.theUsers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeamManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    
    cell.myImage.layer.cornerRadius = cell.myImage.frame.size.width / 2;
    cell.myImage.clipsToBounds = YES;
    cell.myImage.layer.borderWidth = 3.0f;
    cell.myImage.layer.borderColor = [UIColor whiteColor].CGColor;

    
    PFFile *theImage =[seq.theUsers [indexPath.row] objectForKey:@"image"];
    NSData *imageData = [theImage getData];
    if (imageData!=NULL)
        cell.myImage.image = [UIImage imageWithData:imageData];
    else
        cell.myImage.image = [UIImage imageNamed:@"team-placeholder.jpg"];
    
    cell.firstNameLabel.text = [seq.theUsers [indexPath.row] objectForKey:@"firstName"];
    cell.lastNameLabel.text = [seq.theUsers [indexPath.row] objectForKey:@"lastName"];
    cell.positionLabel.text = [seq.theUsers [indexPath.row] objectForKey:@"position"];
    //cell.myImage.image =
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressedAdd:(id)sender {
    PlayerTableViewController *secondViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"playerTable"];
    //secondViewController.thePad = padField.text;
   
    [self.navigationController pushViewController:secondViewController animated:YES];

}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}
@end
