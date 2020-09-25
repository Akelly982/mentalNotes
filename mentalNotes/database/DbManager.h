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

NS_ASSUME_NONNULL_BEGIN

@interface DbManager : NSObject
// this class should have consistent callable methods to getting data from the db


@property TempDb* myDb;


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

- (void) addNote : (Note*) noteToAdd;





@end

NS_ASSUME_NONNULL_END
