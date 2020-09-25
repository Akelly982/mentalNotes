//
//  StatsViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "StatsViewController.h"


@interface StatsViewController ()

@end

@implementation StatsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _db = [[DbManager alloc]init];
    _colors = [[myColors alloc]init];
    
    //user noteArray to get
    // average value   total/len(notesArray)
    // numGoodNotes  == else
    // numAverageNotes <=6
    // numWorseNotes <=4
    
    //run setPage Method
    [self setMyPage:7];
    
    
    //code for gesture to remove keyboard when click away from keyboard
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
    
    
}



//dismiss keyboard method
- (void)dismissKeyboard
{
     [self.view endEditing:YES];
}

//******************************************************
    //changes on click
- (IBAction)onNumNotesTouchCancel:(id)sender {
//    int numNoteArray = (int)[_numNotesTextView text];
//    [self setMyPage:numNoteArray];
}


    //didnt work
- (IBAction)onNoteArrayValueChanged:(id)sender {
//    int numNoteArray = (int)[_numNotesTextView text];
//    NSLog(@"%i", numNoteArray);
//    [self setMyPage:numNoteArray];
}

    //works
- (IBAction)onNoteArrayEditingDidEnd:(id)sender {
    NSString* myNoteVal = [_numNotesTextView text];
    int numNoteArray = [myNoteVal intValue];
    NSLog(@"%@", myNoteVal);
    NSLog(@"%i", numNoteArray);
    
    //NoteArray starts from zero so user input is minus 1
    numNoteArray -= 1;
    
    [self setMyPage:numNoteArray];
}

//*******************************************************

- (void)setMyPage:(int)LenNotesArray{

    //if user enters 0
    if (LenNotesArray >= 1){
        
        // get the array
        _notesArray = [_db getNotesRecent:LenNotesArray];   //in db it checks to make sure lenNotesArray is in range of available notes (Not bigger than the max num of notes)


        int naLength = (int)[_notesArray count];
        int totalAvgCounter = 0;
        int goodCount = 0;
        int avgCount = 0;
        int worseCount = 0;

        for (int i = 0; i < naLength; i++){
            int x = [_notesArray[i] getMood];
            totalAvgCounter += x;
            if (x <= 4){
                worseCount++;
            }else if (x <= 6){
                avgCount++;
            }else{
                goodCount++;
            }
        }
        
                                            //na length plus 1 because array count probs starts at 0
        totalAvgCounter = totalAvgCounter / (naLength + 1);

        //convert to NSString for labels
        NSString* nsTotalAvgCount = [[NSString alloc]initWithFormat:@"%i",totalAvgCounter];
        NSString* nsGoodCount = [[NSString alloc]initWithFormat:@"%i",goodCount];
        NSString* nsAvgCount = [[NSString alloc]initWithFormat:@"%i",avgCount];
        NSString* nsWorseCount = [[NSString alloc]initWithFormat:@"%i",worseCount];

        // set variables to VC
        [_averageMoodValLabel setText: nsTotalAvgCount];
        [_numGoodNotesLabel setText:nsGoodCount];
        [_numAverageNotesLabel setText:nsAvgCount];
        [_numWorseNotesLabel setText:nsWorseCount];

        //determin avg mood val color
        if (totalAvgCounter <= 4){
            [_averageMoodValImageView setBackgroundColor: [[self colors]myRed]];
        }else if (totalAvgCounter <= 6){
            [_averageMoodValImageView setBackgroundColor: [[self colors]myBlue]];
        }else {
            [_averageMoodValImageView setBackgroundColor: [_colors myGreen]];
        }
        
    }else{
        // if user enters 0    //set everything as 0
        NSString* nsTotalAvgCount = [[NSString alloc]initWithFormat:@"%i",0];
        NSString* nsGoodCount = [[NSString alloc]initWithFormat:@"%i",0];
        NSString* nsAvgCount = [[NSString alloc]initWithFormat:@"%i",0];
        NSString* nsWorseCount = [[NSString alloc]initWithFormat:@"%i",0];

        // set variables to VC
        [_averageMoodValLabel setText: nsTotalAvgCount];
        [_numGoodNotesLabel setText:nsGoodCount];
        [_numAverageNotesLabel setText:nsAvgCount];
        [_numWorseNotesLabel setText:nsWorseCount];

        //determin avg mood val color
        [_averageMoodValImageView setBackgroundColor: [[self colors]myRed]];
        
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
