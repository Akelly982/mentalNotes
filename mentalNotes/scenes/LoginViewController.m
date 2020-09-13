//
//  LoginViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "LoginViewController.h"

// initialize functions
void recoverEmail(void);


@interface LoginViewController ()




@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //get user Email from db and set as user email
    _userEmail = @"userEmail@email.com";
}



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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
