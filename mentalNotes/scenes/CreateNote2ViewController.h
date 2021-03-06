//
//  CreateNote2ViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN

@interface CreateNote2ViewController : UIViewController


@property NSString* userNote; //recieves the userNote value from segue
@property NSDate* currentDate;

@property (weak, nonatomic) IBOutlet UITextField *userMoodVal;
@property (weak, nonatomic) IBOutlet UISwitch *userAdvisor1;
@property (weak, nonatomic) IBOutlet UISwitch *userAdvisor2;


@end

NS_ASSUME_NONNULL_END
