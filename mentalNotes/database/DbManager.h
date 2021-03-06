//
//  DbManager.h
//  mentalNotes
//
//  Created by Aidan Kelly on 18/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "TempDb.h"
#import "MySQLDatabase.h"

NS_ASSUME_NONNULL_BEGIN

@interface DbManager : NSObject
// this class should have consistent callable methods to getting data from the db


@property TempDb* myDb;
@property MySQLDatabase* sqlDb;

// userAccount
- (BOOL) getAccountExists;
- (int) getAccountPin;
- (NSString*)getAccountEmail;


- (void) updateAccountExists : (bool) myAccountBool;
- (void) updateAccountPin: (int) myPin;
- (void) updateAccountEmail :(NSString*) userEmail;


// notes
- (NSArray*) getNotes;
- (NSArray*) getNotesRecent : (int) numItems;
- (NSArray*) getNotesGood;
- (NSArray*) getNotesAverage;
- (NSArray*) getNotesWorse;
- (NSArray*) getNotesAdvisor1;
- (NSArray*) getNotesAdvisor2;

- (NSString*) addNote : (Note*) noteToAdd;
- (NSString*) deleteNote : (Note*) noteToDelete;
- (NSString*) updateNote : (Note*) noteToUpdate;





@end

NS_ASSUME_NONNULL_END
