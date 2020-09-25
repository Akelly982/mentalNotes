//
//  ShowNoteTableViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 25/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "ShowNoteTableViewController.h"

@interface ShowNoteTableViewController ()

@end

@implementation ShowNoteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //AK color class
    _color = [[myColors alloc]init];
    
    
    //set up VC
    [_noteLabel setText:[_note getNote]];
    [_dateLabel setText:[_note getDateAsNSString]];
    [_advisor1Switch setOn:[_note getAdvisor1]];
    [_advisor2Switch setOn:[_note getAdvisor2]];
    
    //set up mood value and image
    NSString* myMoodValStr = [[NSString alloc] initWithFormat:@"%i",[_note getMood]];
    [_moodValueLabel setText:myMoodValStr];
    
    //moodImage setBKG expects a UIColor
    int myMood = [_note getMood];
    if (myMood <= 4){
        [_moodImageView setBackgroundColor: [_color myRed]];
    }else if (myMood <= 6){
        [_moodImageView setBackgroundColor: [_color myBlue]];
    }else {
        [_moodImageView setBackgroundColor: [_color myGreen]];
    }
    
    
    
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

@end
