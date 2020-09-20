//
//  FirstStartViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "FirstStartViewController.h"

@interface FirstStartViewController ()

@end

@implementation FirstStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
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





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
