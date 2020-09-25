//
//  NotesTableViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "NotesTableViewController.h"

@interface NotesTableViewController ()

@end

@implementation NotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    
    //start connection to db
    _db = [[DbManager alloc]init];

    
    //set mood colors
    _color = [[myColors alloc]init];
    [_goodNotesImageView setBackgroundColor: [_color myGreen]];
    [_averageNotesImageView setBackgroundColor: [_color myBlue]];
    [_worseNotesImageView setBackgroundColor: [_color myRed]];
        
}



    //@@This row needs to be added in by on your own@@
    // user selected a row and this is which one it is
    // what will hapen when the user taps this row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Notes row selected is: %i", (int)[indexPath row]);
    int index = (int)[indexPath row];
    
    //testing int
    //NSLog(@"Row == %i",index);
    
    
    //AK understanding table view
    // cells within the table view are number 0 - n from top to bottom
    // im going to to use this index path to segue to another screen passing reguired data
    
    // table view setup is (adjust if changed)
    //  0 == header
    //  1 == good notes
    //  2 == average notes
    //  3 == worse notes
    //  4 == advisor 1
    //  5 == advisor 2
    //  6 == show all
    
    switch(index){
        case 1:
            NSLog(@"Good notes");
            //_notesData = [_db getNotes];
            break;
        case 2:
            NSLog(@"Average notes");
            break;
        case 3:
            NSLog(@"Worse notes");
            break;
        case 4:
            NSLog(@"Advisor 1 notes");
            break;
        case 5:
            NSLog(@"Advisor 2 notes");
            break;
        case 6:
            NSLog(@"Show all notes");
            _notesData = [_db getNotes];
            break;
        default:
            NSLog(@"default case hit");
    }
    
    
    
    
    // REFERNECE CODE FOR SEGUE THROUGH CODE
    
//
//    - (IBAction)myLoginFunc:(id)sender {
//        if (_userEnteredPin == [_myDb getAccountPin]){
//            //initiate segue if true
//            [self performSegueWithIdentifier:@"fromLogin0" sender:nil];
//        }else{
//            NSLog(@"invalid password");
//        }
//    }
    
    
    
    
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    //warning Incomplete implementation, return the number of sections
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    //warning Incomplete implementation, return the number of rows
//    return [[self notesData] count];
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    NSString* cellIdentifier = @"notesCell";
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//
//    // Configure the cell...
//    if (cell == nil){   // if a new cell not yet loaded
//        //init cell with default style and cell id
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//    }
//
//    //add data
//    [[cell textLabel] setText:[[_notesData objectAtIndex:[indexPath row]]getNote]];  //getNote here is a method of the Note class (returns strings)
//
//
//    return cell;
//}
//
//
//    //if pressed on a cell method
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"Row selected - num row is: %li", (long)[indexPath row]);
//}







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
