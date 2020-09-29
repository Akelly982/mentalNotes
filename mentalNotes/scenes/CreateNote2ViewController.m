//
//  CreateNote2ViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "CreateNote2ViewController.h"
#import "DbManager.h"

@interface CreateNote2ViewController ()

@end

@implementation CreateNote2ViewController

-(void) showUIAlertWithMessage:(NSString*) message andTitle:(NSString*)title{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            NSLog(@"You have saved the planet");
        }];
        [alert addAction:okAction];
    
        [self presentViewController:alert animated:YES completion:^{
            NSLog(@"%@", message);
        }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",_userNote); //this is set on segue
    _currentDate = [NSDate date];  // should get current date and time
    
    // convert current date to just date no time and set format
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"yyyy-MM-dd HH:mm"];  //needs to be in this shape to work with db
                                                 // this is also set when getting the date from the NOTE
    //convert date to string to get correct format
    NSString* myDateStr = [dateFormater stringFromDate:_currentDate];
    //convert string back into date datatype with the correct format;
    _currentDate = [dateFormater dateFromString:myDateStr];
    
    
    
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

- (IBAction)createNoteButton:(id)sender {
    NSLog(@"Create Note button clicked");
    //get values
    NSString* myMood = [_userMoodVal text]; //label so it comes as string
    bool myAdvisor1 = [_userAdvisor1 isOn];  // should return bool depending switch UI component
    bool myAdvisor2 = [_userAdvisor2 isOn];
    
    //check to make sure they are correct
    int myMoodVal = [myMood intValue];
    
    //make is so that mood val is between 0 and 10
    if (myMoodVal < 0 || myMoodVal > 10 ){  //allows for early skip if in range else check
        if (myMoodVal < 0){
            myMoodVal = 0;
        }else{
            myMoodVal = 10;
        }
    }
    
    //create new note
    Note* newNote = [[Note alloc]initNoteForDb:_userNote moodValue:myMoodVal date:_currentDate advisor1:myAdvisor1 Advisor2:myAdvisor2];
    
    
    //connect to db
    DbManager* db = [[DbManager alloc]init];
    
    //send to db
    NSString* result = [db addNote:newNote];
    NSLog(@"%@",result);
    //show alert with result (issues with unwind segue  shows then disapears due to VC change)
    //[self showUIAlertWithMessage:result andTitle:@"Database"];
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
