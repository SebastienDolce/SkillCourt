//
//  ManageDrillsTableViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 1/29/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "ManageDrillsTableViewController.h"

@interface ManageDrillsTableViewController ()

@end

@implementation ManageDrillsTableViewController
@synthesize myInfo, drilNames,sequenceList;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[[UIView alloc] init]];
    sequenceList = [SequenceList sharedList];
    drilNames = [[NSMutableArray alloc] init];
   // GridInfo *myg = [[GridInfo alloc] init : @"first" : 2 : 2 ];
   // GridInfo *myg2 = [[GridInfo alloc] init : @"second" : 2 : 2 ];
   // GridInfo *myg3 = [[GridInfo alloc] init : @"third" : 2 : 2 ];
   // [sequenceList addGrid:myg];
   // [sequenceList addGrid:myg2];
   // [sequenceList addGrid:myg3];
    //[sequenceList.theInfo addObject:myg];
   // [sequenceList.theInfo addObject:myg2];
   // [sequenceList.theInfo addObject:myg3];
   // [drilNames addObject:myg];
    //[drilNames addObject:myg2];
   // [drilNames addObject:myg3];
    //if (myInfo != nil)
      //  [sequenceList addGrid:myInfo];
      //  [drilNames addObject:myInfo];

    //self.navigationItem.leftBarButtonItem = nil;
    //self.navigationItem.hidesBackButton = YES;
     self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"skillcourt Background.png"]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [sequenceList.theSequence count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = sequenceList.theSequence [indexPath.row] ;
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath

{
    AddDrillViewController *secondViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"addDrillView"];
    //secondViewController.thePad = padField.text;
    
    [self.navigationController pushViewController:secondViewController animated:YES];

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"drillDetails"])
    {
        StepTableViewController *stepTable = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       // GridInfo *mygrid = sequenceList.theInfo [indexPath.row];
       // stepTable.thegrid = mygrid;
    }

}





- (void) viewWillAppear:(BOOL)animated
{
    //[drilNames addObject: myInfo.gridName];
    [self.tableView reloadData];
}

- (IBAction)pressedAddDrill:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New Drill" message:@"Enter a name for the Drill" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // The user created a new item, add it
    if (buttonIndex == 1)
    {
        
        [sequenceList.theSequence addObject: [[alertView textFieldAtIndex:0] text]];
        
                // Get the input text
        //NSString *newItem = [[alertView textFieldAtIndex:0] text];
        [self.tableView reloadData];
    }
}



@end
