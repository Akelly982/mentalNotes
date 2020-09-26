//
//  NoteCategoryTableViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 26/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "myColors.h"
#import "NoteTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoteCategoryTableViewController : UITableViewController

@property NSArray* noteArray;
@property Note* selectedNote;
@property myColors* color;
@property NSString* myCategory;

@property (weak, nonatomic) IBOutlet UILabel *categoryTitleLabel;
@property (strong, nonatomic) IBOutlet UITableView *noteTableView;

@end

NS_ASSUME_NONNULL_END
