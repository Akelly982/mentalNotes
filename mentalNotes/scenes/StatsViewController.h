//
//  StatsViewController.h
//  mentalNotes
//
//  Created by Aidan Kelly on 12/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "DbManager.h"
#import "myColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatsViewController : UIViewController

@property NSArray* notesArray;
@property DbManager* db;
@property myColors* colors;



@property (weak, nonatomic) IBOutlet UITextField *numNotesTextView;

@property (weak, nonatomic) IBOutlet UILabel *averageMoodValLabel;
@property (weak, nonatomic) IBOutlet UIImageView *averageMoodValImageView;

@property (weak, nonatomic) IBOutlet UILabel *numGoodNotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *numAverageNotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *numWorseNotesLabel;


-(void) setMyPage: (int) LenNotesArray;



@end

NS_ASSUME_NONNULL_END
