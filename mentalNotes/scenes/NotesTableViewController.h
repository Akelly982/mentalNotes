//
//  NotesTableViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbManager.h"
#import "Note.h"
#import "myColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotesTableViewController : UITableViewController

@property NSArray* notesData;
@property DbManager* db;
@property myColors* color;

@property (weak, nonatomic) IBOutlet UIImageView *goodNotesImageView;
@property (weak, nonatomic) IBOutlet UIImageView *averageNotesImageView;
@property (weak, nonatomic) IBOutlet UIImageView *worseNotesImageView;


@property (strong, nonatomic) IBOutlet UITableView *notesTableView;
@property (weak, nonatomic) IBOutlet UITableViewCell *headerTableViewCell;

@end

NS_ASSUME_NONNULL_END
