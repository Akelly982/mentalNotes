//
//  TempDb.h
//  mentalNotes
//
//  Created by Aidan Kelly on 18/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN



@interface TempDb : NSObject

@property NSDictionary* TDatabase;
@property BOOL accountExists;
@property int accountPin;
@property NSString* userEmail;

// notes
- (NSArray*) getNotes;
- (NSArray*) getNotesRecent : (int) numNotes;
- (NSArray*) getNotesGood;
- (NSArray*) getNotesAverage;
- (NSArray*) getNotesWorse;
- (NSArray*) getNotesAdvisor1;
- (NSArray*) getNotesAdvisor2;

- (void) addNote: (Note*) noteToInsert;
- (void) deleteNote: (Note*) noteToDelete;
- (void) updateNote: (Note*) noteToUpdate;



// user account data
- (BOOL)getAccountExists;
- (int)getAccountPin;
- (NSString*)getUserEmail;

- (void)updateAccountExists: (BOOL) myAccountBool;
- (void)updateAccountPin : (int) myPin;
- (void)updateUserEmail : (NSString*) myEmail;


@end

NS_ASSUME_NONNULL_END
