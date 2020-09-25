//
//  ShowNoteTableViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 25/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "myColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowNoteTableViewController : UITableViewController


@property Note* note;

@property myColors* color;

@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;
@property (weak, nonatomic) IBOutlet UILabel *moodValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UISwitch *advisor1Switch;
@property (weak, nonatomic) IBOutlet UISwitch *advisor2Switch;


@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;

@end

NS_ASSUME_NONNULL_END
