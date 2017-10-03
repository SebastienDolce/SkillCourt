//
//  PlayerTableViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 5/2/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "PlayerTableViewController.h"

@interface PlayerTableViewController ()

@end

@implementation PlayerTableViewController
@synthesize players, player, checkOn, theList;

- (void)viewDidLoad {
    [super viewDidLoad];
    theList = [SequenceList sharedList];
    players = [[NSMutableArray alloc] init];
    //self.navigationItem.rightBarButtonItem =
    //[[UIBarButtonItem alloc]
    // initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
   //  target:self
   //  action:@selector(Add:)];
    //checkOn = [[NSMutableArray alloc] initWithObjects:@"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false", @"false" , nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"skillcourt Background.png"]];
    PFQuery *userQuery = [PFUser query];
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        self.players = [objects mutableCopy] ;
        [self.tableView reloadData];
        
        
    }];
    
   // dispatch_async(dispatch_get_main_queue(), ^{
      //  for (int i = 0; i< [players count] ; i++) {
         //   [checkOn addObject:@"false"];
      //  }

    
   // });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [players count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeamManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
    
    cell.myImage.layer.cornerRadius = cell.myImage.frame.size.width / 2;
    cell.myImage.clipsToBounds = YES;
    cell.myImage.layer.borderWidth = 3.0f;
    cell.myImage.layer.borderColor = [UIColor whiteColor].CGColor;
    
    PFFile *theImage =[players [indexPath.row] objectForKey:@"image"];
    NSData *imageData = [theImage getData];
    if (imageData!=NULL)
        cell.myImage.image = [UIImage imageWithData:imageData];
    else
        cell.myImage.image = [UIImage imageNamed:@"team-placeholder.jpg"];
    
    cell.firstNameLabel.text = [players [indexPath.row] objectForKey:@"firstName"];
    cell.lastNameLabel.text = [players [indexPath.row] objectForKey:@"lastName"];
    cell.positionLabel.text = [players [indexPath.row] objectForKey:@"position"];
    [checkOn addObject:@"false"];
    //cell.myImage.image =
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    player =  players [indexPath.row];
   // for (PFUser* user in theList.theUsers)
    //{
     //   if (![[user objectForKey:@"firstName"] isEqualToString: [player objectForKey:@"firstName"]])
    //    {
            [theList.theUsers addObject:player];
   //     }
  //  }
    
    TeamManagementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
    cell.firstNameLabel.text = [player objectForKey:@"firstName"];
    cell.lastNameLabel.text = [player objectForKey:@"lastName"];
    cell.positionLabel.text = [player objectForKey:@"position"];
    if (checkOn [indexPath.row] ==nil || [checkOn [indexPath.row]  isEqual:@"false"])
    {
        cell.myImage2.image = [UIImage imageNamed:@"check mark.png"];
        [checkOn [indexPath.row] insertObject:@"true" atIndex:indexPath.row];
    }
    if ([checkOn [indexPath.row]  isEqual:@"true"]) {
        cell.myImage2.image = nil;
        [checkOn [indexPath.row] insertObject:@"false" atIndex:indexPath.row];
    }
    
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


//#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"addPlayer"])
    {
        TeamsManagementTableViewController *stepTable = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PFUser *myuser = players [indexPath.row];
        stepTable.player = myuser;
    }

}
*/
/*
-(IBAction)Add:(id)sender
{
    TeamsManagementTableViewController *secondViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"teamTable"];
    //secondViewController.thePad = padField.text;
    secondViewController.player =player;
    [self.navigationController pushViewController:secondViewController animated:YES];
}
*/
@end
