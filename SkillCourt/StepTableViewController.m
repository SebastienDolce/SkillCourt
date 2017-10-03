//
//  StepTableViewController.m
//  SkillCourt
//
//  Created by sebastien dolce on 4/17/16.
//  Copyright © 2016 Gummy. All rights reserved.
//

#import "StepTableViewController.h"

@interface StepTableViewController ()

@end

@implementation StepTableViewController
@synthesize thegrid, theSteps, theStep, theCommand, theCommands, myarr1, myarr2, myarr3, sequenceList, stepNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"skillcourt Background.png"]];
    sequenceList = [SequenceList sharedList];
  //  Step *astep2 = [[Step alloc] init:5 :5];
  //  Step *astep3 = [[Step alloc] init:10 :10];
  //  Step *astep = [[Step alloc] init:20 :10];
  ///  myarr3 = [[NSMutableArray alloc] initWithObjects:@"1-1",@"1-2", @"1-3", @"1-1", @"1-2", @"1-3" , nil];
    
  //  GridCommand *acom2 = [[GridCommand alloc] init:@"second" :1 :1 :0 :255 :0 :002];
    
  //  GridCommand *acom = [[GridCommand alloc] init:@"first" :1 :1 :0 :255 :0 :001];
    
//
    //GridCommand *acom3 = [[GridCommand alloc] init:@"third" :1 :1 :0 :255 :0 :003];
    
   // [sequenceList.theSteps addObject:astep];
   // [sequenceList.theSteps addObject:astep2];
  //  [sequenceList.theSteps addObject:astep3];
    
  //  [sequenceList.theCommands addObject:acom];
  //  [sequenceList.theCommands addObject:acom2];
 //   [sequenceList.theCommands addObject:acom3];
    
    
 //   myarr3 = [[NSMutableArray alloc] initWithObjects:@"one", @"two", @"three", nil];
    
    //myarr1 = [[NSMutableArray alloc] initWithObjects:astep, astep2, astep3, nil];
   // myarr2 = [[NSMutableArray alloc] initWithObjects:acom, acom2, acom3, nil];
    
   // if (theStep!=nil && theCommand!=Nil)
  //  {
   //     [sequenceList.theSteps addObject:theStep];
  //      [sequenceList.theCommands addObject:theCommand];
  //  }
   // GridCommand *acom4 = [[GridCommand alloc] init:@"second" :1 :1 :0 :255 :0 :002];
  //  Step *astep4 = [[Step alloc] init:5 :5];
    //[theSteps addObject:astep];
  //  [theCommands addObject:acom];
    
   // [theSteps addObject:astep2];
  //  [theCommands addObject:acom2];
 // /
  //  [theSteps addObject:astep3];
   // [theCommands addObject:acom3];

    if ( theStep!= nil && theCommand != nil)
    {
        [sequenceList.theSteps addObject:theStep];
        [sequenceList.theCommands addObject:theCommand];
   }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    [self.tableView reloadData];
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    //return [theSteps count];
    return [sequenceList.theSteps count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StepsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stepsCell" forIndexPath:indexPath];
    
    // Configure the cell...
      // cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",[theSteps [indexPath.row] theDuration]];

   // cell.textLabel.text =  [theCommands [indexPath.row] gridName];
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
    cell.durationLabel.text = [NSString stringWithFormat:@"%ld",[sequenceList.theSteps [indexPath.row] theDuration]];
    cell.intervalLabel.text = [NSString stringWithFormat:@"%ld",[sequenceList.theSteps [indexPath.row] theInterval]];
   // cell.stepNumberLabel.text =  [NSString stringWithFormat:@"%lu",(unsigned long)[sequenceList.theSteps count]];
    cell.stepNumberLabel.text =  [NSString stringWithFormat:@"%lu",(unsigned long)indexPath.row +1];
    
    NSString *str =[[NSString stringWithFormat:@"%ld",(long)[sequenceList.theCommands [indexPath.row] theRow]] stringByAppendingString:@" - "];
    cell.padLabel.text = [str  stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)[sequenceList.theCommands [indexPath.row] theCol]]];
  //  cell.padLabel.text = [NSString stringWithFormat:@"%ld",[myarr2 [indexPath.row] ]];
    //cell.textLabel.text = myarr3 [indexPath.row];

    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"tochild"])
    {
        AddStepViewController *stepAdd = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       // GridInfo *mygrid = drilNames [indexPath.row];
        stepAdd.theStep = theSteps [indexPath.row];
        stepAdd.theSteps = theSteps;
        stepAdd.thegrid = thegrid;
    }

}


- (IBAction)pressedCreate:(id)sender {
    NSMutableDictionary *gameInfo = [[NSMutableDictionary alloc]init];
    [gameInfo setValue:@"Dolce" forKey:@"author"];
    [gameInfo setValue:@"test sequence" forKey:@"sequenceName"];
    [gameInfo setValue:@"1.0" forKey:@"version"];
    [gameInfo setValue:@"easy" forKey:@"difficulty"];
    [gameInfo setValue:@"classic" forKey:@"gameType"];
    
    NSMutableArray *allGrids = [[NSMutableArray alloc] initWithObjects:thegrid, nil];
    UIAlertView *loginFailure = [[UIAlertView alloc] initWithTitle: @"success" message: @"sequence saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [loginFailure show];
    
    //SequenceFile *mySequence = [[SequenceFile alloc] init:gameInfo :allGrids :myarr2 ];
    
   // [mySequence exportFile:@"testSequence"];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

@end
