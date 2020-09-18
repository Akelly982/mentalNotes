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

NS_ASSUME_NONNULL_BEGIN

@interface NotesTableViewController : UITableViewController

@property NSArray* notesData;


@end

NS_ASSUME_NONNULL_END
