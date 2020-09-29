//
//  HomeTableViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "HomeTableViewController.h"
#import "BlueViewController.h"
#import "ShowNoteTableViewController.h"


@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

    //****************NOTES VALUE REF****************
        // numGoodNotes  == else
        // numAverageNotes <=6
        // numWorseNotes <=4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _db = [[DbManager alloc]init];
    _homeData = [_db getNotesRecent:10];
    
    
    _colors = [[myColors alloc]init];
    //test usingColor
    //[[self colors] myRed];
    
    
}



// SETTING UP UNWIND
//*sourceViewController is where you are coming back from
- (IBAction)unwindToHomeVc:(UIStoryboardSegue *)unwindSegue {
    UIViewController *sourceViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
    
    // if i come back from somewhere get notesArray again. it should have changed
    _homeData = [_db getNotesRecent:10];
    // then reload the tableView
    [self.tableView reloadData];
    
    // has this property been implemented
    if ([sourceViewController respondsToSelector:@selector(methodInBlue)]){ //dont foget to import the corresponding VCheader
    // i know that i am coming back from the pink view controller
    NSLog(@"Returned from Blue VC");
    }
};







#pragma mark - Table view data source

// number of tables you are trying to show
    // homeData == 1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        //warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        //warning Incomplete implementation, return the number of rows
    return [_homeData count];
}

// Main method to display each row
// called per row
// NSIndexPath is a class that among other things has the row the user
//              has selected.  (the row we are working with now == index path)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // get the identifier for the cell
    static NSString* myCellIdenifier = @"homeCell";
    
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellIdenifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil){  // if it is a new cell (not yet loaded)
        // init with default sytle and cellId
        cell = [[NoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCellIdenifier];
    }
    // add data
    // cell class already exists
    //      cell              set text using _dataArray at current indexPath (which row we are at)
//    [[cell textLabel] setText:[[_homeData objectAtIndex:[indexPath row]] getNote]];
    
    [[cell noteLabel] setText:[[_homeData objectAtIndex:[indexPath row]] getNote]];
    
    
    [[cell dateLabel] setText:[[_homeData objectAtIndex:[indexPath row]] getDateAsNSString]];
    
    //moodImage setBKG expects a UIColor
    int myMood = [[_homeData objectAtIndex:[indexPath row]] getMood];
    if (myMood <= 4){
        [[cell moodImageView] setBackgroundColor: [[self colors]myRed]];
    }else if (myMood <= 6){
        [[cell moodImageView] setBackgroundColor: [[self colors]myBlue]];
    }else {
        [[cell moodImageView] setBackgroundColor: [[self colors]myGreen]];
    }
    
    
    
    return cell;
    
//
    
}


    //@@This row needs to be added in by on your own@@
    // user selected a row and this is which one it is
    // what will hapen when the user taps this row
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"Row selected - num row is: %li", (long)[indexPath row]);
//    _selectedNote = [_homeData objectAtIndex:[indexPath row]];
//}





// TEACHER ALEX SEGUE USING DESTINATION CLASS AS ID
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
//    if ([myObject isKindOfClass:[AnObject class]])
    if([[segue destinationViewController] isKindOfClass:[ShowNoteTableViewController class]]){
        NSLog(@"Segueing to ShowNote !");
        //get the contact from the table view (don't forget to create the outlet for contactsTableView in the ContactsTableViewController.h)
        NSInteger selectedRow = [[[self homeTableView] indexPathForSelectedRow] row]; //use tableView to get row selected
        _selectedNote = [[self homeData] objectAtIndex:selectedRow];
        //get the destination view controller
        ShowNoteTableViewController* showNoteTableViewController = [segue destinationViewController];
        [showNoteTableViewController setNote:_selectedNote]; // note in next view = selectedNote
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
