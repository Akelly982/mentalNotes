//
//  CreateNoteViewController.m
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "CreateNoteViewController.h"

@interface CreateNoteViewController ()

@end

@implementation CreateNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // set border style to round
    // code from internet
    //userTextField.borderStyle = UITextBorderStyle.RoundedRect;
    _noteTextField.borderStyle = UITextBorderStyleRoundedRect;
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
