//
//  LoginViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property NSString* login;
@property DbManager* myDb;
@property int userEnteredPin;

@property (weak, nonatomic) IBOutlet UITextField *myPinTextField;
@property (weak, nonatomic) IBOutlet UIButton *myLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPinBtn;

@property NSString* userEmail;

@end

NS_ASSUME_NONNULL_END
