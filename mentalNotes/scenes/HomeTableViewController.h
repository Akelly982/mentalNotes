//
//  HomeTableViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DbManager.h"
#import "Note.h"
#import "HomeTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewController : UITableViewController

@property NSArray* homeData;
@property Note* selectedNote;

@property UIColor* myRed;


//cell components
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

@end

NS_ASSUME_NONNULL_END
