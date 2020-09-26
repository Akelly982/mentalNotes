//
//  NoteCategoryTableViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 26/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "NoteCategoryTableViewController.h"
#import "ShowNoteTableViewController2.h"

@interface NoteCategoryTableViewController ()

@end

@implementation NoteCategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // get colors
    _color = [[myColors alloc]init];
    
    // set category label
    [_categoryTitleLabel setText:_myCategory];
    
    
}



// SETTING UP UNWIND
//*sourceViewController is where you are coming back from
- (IBAction)unwindToNotesCategoryVc:(UIStoryboardSegue *)unwindSegue {
    UIViewController *sourceViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
    
    // has this property been implemented
    if ([sourceViewController respondsToSelector:@selector(noteArray)]){ //dont foget to import the corresponding VCheader
        // i know that i am coming back from the pink view controller
        NSLog(@"Returned from NoteCategoryView");
    }else if([sourceViewController respondsToSelector:@selector(note)]){
        
    }
};





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ //warning Incomplete implementation, return the number of rows
    return [_noteArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //cell id
    NSString* cellId = @"noteCell";
    
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil){  // if it is a new cell (not yet loaded)
        // init with default sytle and cellId
        cell = [[NoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //add data
    [[cell noteLabel] setText:[[_noteArray objectAtIndex:[indexPath row]] getNote]];
    [[cell dateLabel] setText:[[_noteArray objectAtIndex:[indexPath row]] getDateAsNSString]];
    //moodImage setBKG expects a UIColor
    int myMood = [[_noteArray objectAtIndex:[indexPath row]] getMood];
    if (myMood <= 4){
        [[cell moodImageView] setBackgroundColor: [[self color]myRed]];
    }else if (myMood <= 6){
        [[cell moodImageView] setBackgroundColor: [[self color]myBlue]];
    }else {
        [[cell moodImageView] setBackgroundColor: [[self color]myGreen]];
    }
    
    return cell;
}




// TEACHER ALEX SEGUE USING DESTINATION CLASS AS ID
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
//    if ([myObject isKindOfClass:[AnObject class]])
    if([[segue destinationViewController] isKindOfClass:[ShowNoteTableViewController2 class]]){
        NSLog(@"Segueing to ShowNote2");
        //get the contact from the table view (don't forget to create the outlet for contactsTableView in the ContactsTableViewController.h)
        NSInteger selectedRow = [[[self noteTableView] indexPathForSelectedRow] row]; //use tableView to get row selected
        _selectedNote = [[self noteArray] objectAtIndex:selectedRow];
        NSLog(@"Note text: %@", [_selectedNote getNote]);
        //get the destination view controller
        ShowNoteTableViewController2* showNoteTVC2 = [segue destinationViewController];
        [showNoteTVC2 setNote:_selectedNote]; // note in next vc = selectedNote
        
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
