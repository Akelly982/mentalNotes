//
//  Sqlite3.h
//  mentalNotes
//
//  Created by Aidan Kelly on 29/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN



@interface MySQLDatabase : NSObject



@property NSString* databasePath;
@property sqlite3* db;


@property NSString* docsDir;
@property NSArray* dirPath;
@property NSFileManager* fileManager;
@property const char* dbPath;
@property char* errorMessage;

// SHOULD BE CONST but causes a warning on use
@property NSString* DBFILENAME; //= @"userNotes.db";
@property NSString* TABLENAME1;
@property NSString* ID;
@property NSString* NOTE;
@property NSString* MOOD;
@property NSString* DATE;
@property NSString* ADVISOR1;
@property NSString* ADVISOR2;





// notes
- (NSArray*) getNotesAllNotesByRecent;
- (NSArray*) getNotesRecent : (int) numNotes;
- (NSArray*) getNotesGood;
- (NSArray*) getNotesAverage;
- (NSArray*) getNotesWorse;
- (NSArray*) getNotesAdvisor1;
- (NSArray*) getNotesAdvisor2;

- (NSString*) addNote: (Note*) noteToInsert;
- (NSString*) deleteNote: (Note*) noteToDelete;
- (NSString*) updateNote: (Note*) noteToUpdate;





@end

NS_ASSUME_NONNULL_END
