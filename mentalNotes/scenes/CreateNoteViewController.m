//
//  CreateNoteViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "CreateNoteViewController.h"
#import "CreateNote2ViewController.h"


@interface CreateNoteViewController ()

@end

@implementation CreateNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _userNote = [[NSString alloc]init];
    //fromCreateNote
    
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


- (IBAction)onTempButtonClick:(id)sender {
    NSLog(@"I am the temp button, I am immortal");
}

- (IBAction)onEditingDidEnd:(id)sender {
    _userNote = [_userNoteTextField text];
    NSLog(@"userNote update to: %@", _userNote );
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"from create mnote segue has begun.");
    if([[segue identifier] isEqualToString:@"fromCreateNote"]){
        //leaving create note VC
        CreateNote2ViewController* create2VC = [segue destinationViewController];
        
        create2VC.userNote = _userNote;
    }
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    NSLog(@"fromBlue segue has been called");
//        //[segue identifier]   this is a getter
//    if([[segue identifier] isEqualToString:@"fromBlue"]){
//        // leaving blue view controller
//        RedViewController* redVc = [segue destinationViewController];
//        redVc.contact = [self contact];
//        //[redVc contact] = _contact;
//    }
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
