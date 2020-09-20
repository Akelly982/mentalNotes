//
//  CreateNoteViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CreateNoteViewController : UIViewController


@property NSString* userNote; 
@property (weak, nonatomic) IBOutlet UITextField *userNoteTextField;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;


@property (weak, nonatomic) IBOutlet UIButton *tempBtn;


@end

NS_ASSUME_NONNULL_END
