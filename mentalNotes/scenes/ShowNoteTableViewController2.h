//
//  ShowNoteTableViewController2.h
//  mentalNotes
//
//  Created by Aidan Kelly on 26/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "myColors.h"

NS_ASSUME_NONNULL_BEGIN


//NOTE YOU CANT USE THE SAME VIEW TWICE IT GETS CONFUSED
@interface ShowNoteTableViewController2 : UITableViewController


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


// setup in initial ShowNoteTableViewController
//@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;
//@property (weak, nonatomic) IBOutlet UILabel *moodValueLabel;
//
//@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
//
//@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
//
//@property (weak, nonatomic) IBOutlet UISwitch *advisor1Switch;
//@property (weak, nonatomic) IBOutlet UISwitch *advisor2Switch;
//
//
//@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
//@property (weak, nonatomic) IBOutlet UIButton *updateBtn;


@end

NS_ASSUME_NONNULL_END
