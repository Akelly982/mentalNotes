//
//  LoginViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "LoginViewController.h"
#import "FirstStart2ViewController.h"


// initialize functions
void recoverEmail(void);


@interface LoginViewController ()




@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //connect to db
    _myDb = [[DbManager alloc]init];
    
    if ([_myDb getAccountExists]){
        //get user email from db and set to email
        _userEmail = [_myDb getAccountEmail];
    }

    
    /*
     ============== Important ==============
     this is for the UITextField: hide keyboard by touching somewhere else using gestures, also create the dismisskeyboard method
     */
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
    
}

//dismiss keyboard method
- (void)dismissKeyboard
{
     [self.view endEditing:YES];
}


- (IBAction)myPinFunc:(id)sender {
    NSString* temp = [_myPinTextField text];  //convert to NSString
    _userEnteredPin = [temp intValue]; //use the NSSstring through method intVal to get as int
    NSLog(@"User Entered pin: %i", _userEnteredPin);
}

- (IBAction)myLoginFunc:(id)sender {
    if (_userEnteredPin == [_myDb getAccountPin]){
        //initiate segue if true
        [self performSegueWithIdentifier:@"fromLogin0" sender:nil];
    }else{
        NSLog(@"invalid password");
    }
}




// ALERT FUNCTION for forgot pin
- (IBAction)forgotPinBtnClicked:(id)sender {
    //create an ui alert controller
    UIAlertController* forgotPinAlert = [[UIAlertController alloc] init]; //create alert object
    
    //set up alert
    NSString* myEmailMessage = [[NSString alloc] initWithFormat:@"Do you want us to send you a pin recovery email to %@", _userEmail];
    
    [forgotPinAlert setTitle:@"Pin recovery"];
    [forgotPinAlert setMessage:myEmailMessage];
    [forgotPinAlert modalPresentationStyle];
    
    
    //create alert action resend email
    UIAlertAction* resendEmailAction = [UIAlertAction actionWithTitle:@"Send recovery email" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        // write action code here
        NSLog(@"Recovery email send Action clicked");
        recoverEmail();
    }];
    

    //create alert action close
    UIAlertAction* closeAction = [UIAlertAction actionWithTitle:@"close" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"closed email recovery alert");
    }];
    
    [forgotPinAlert addAction:resendEmailAction];
    [forgotPinAlert addAction:closeAction];
    
    //DONT FORGET TO ADD THIS BELOW SHOWS TO USER
    //present / show to the user
    [self presentViewController: forgotPinAlert animated: YES completion: nil];
    
}





void recoverEmail(){
    NSLog(@"ran recovery email function");
}



//Unwind From FirstStart
// SETTING UP UNWIND
//*sourceViewController is where you are coming back from
- (IBAction)unwindToLoginVc:(UIStoryboardSegue *)unwindSegue {
    UIViewController *sourceViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue

    // has this property been implemented
    if ([sourceViewController respondsToSelector:@selector(fromFirstStart2)]){ //dont foget to import the corresponding VCheader
    // i know that i am coming back from the pink view controller
    NSLog(@"Returned from FirstStart2");
    }
};




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
