//
//  Sqlite3.m
//  mentalNotes
//
//  Created by Aidan Kelly on 29/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "MySQLDatabase.h"

@implementation MySQLDatabase

- (instancetype)init
{
    self = [super init];
    if (self) {
        //AK pre set NSStrings
        _DBFILENAME = @"userNotes.db";
        _TABLENAME1 = @"NOTES";
        _ID = @"ID";
        _NOTE = @"NOTE";
        _MOOD = @"MOOD";
        _DATE = @"DATE";
        _ADVISOR1 = @"ADVISOR1";
        _ADVISOR2 = @"ADVISOR2";
        
        
        //check if db exists else create
        _dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        _docsDir = _dirPath[0];
        
        _databasePath = [[NSString alloc]initWithString:[_docsDir stringByAppendingPathComponent:_DBFILENAME]];
        
        _fileManager = [NSFileManager defaultManager];
        
        if ([_fileManager fileExistsAtPath:_databasePath] == NO){
            _dbPath = [_databasePath UTF8String];
            NSLog(@"Database file does not exists");
            if (sqlite3_open(_dbPath, &_db) == SQLITE_OK){
                NSLog(@"Database creation success");
                //create table var order
                    // tableName1
                    // ID
                    // Note
                    // Mood
                    // Date
                    // Advisor1
                    // Advisor2
                
                //NSString* sqlStatement =[NSString stringWithFormat: @"CREATE table if not exists \"%@\" (\"%@\" INTEGER PRIMARY KEY AUTOINCREMENT, \"%@\" TEXT, \"%@\" INTEGER, \"%@\" TEXT, \"%@\" BOOLEAN, \"%@\" BOOLEAN )",_TABLENAME1,_ID,_NOTE,_MOOD,_DATE,_ADVISOR1,_ADVISOR2];
                NSString* sqlStatement =[NSString stringWithFormat: @"CREATE table if not exists %@ (%@ INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ INTEGER, %@ TEXT, %@ INTEGER, %@ INTEGER )",_TABLENAME1,_ID,_NOTE,_MOOD,_DATE,_ADVISOR1,_ADVISOR2];
                const char* createStatement = [sqlStatement UTF8String];
                if (sqlite3_exec(_db, createStatement, NULL, NULL, &_errorMessage) != SQLITE_OK){
                    NSLog(@"Failed to create table at EXEC");
                }
                NSLog(@"Database Successful initial creation");
                sqlite3_close(_db); //close connection
            }else{
                NSLog(@"Database create failed");
            }
        }else{
            NSLog(@"Database file exists");
        }
        
    }
    return self;
}








//******* ADJUST DB ******************

- (NSString*)addNote:(id)noteToInsert{
    sqlite3_stmt* statement;
    _dbPath = [_databasePath UTF8String];  // include this to rest
    NSString* returnMsg = [[NSString alloc]init];
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){
        //tableName
        //Note
        //Mood
        //date
        //advisor1
        //advisor2
        //NSString* insertSQL = [NSString stringWithFormat:@"INSERT INTO \"%@\" (\"%@\", \"%@\", \"%@\",\"%@\",\"%@\") VALUES (\"%@\", %d, \"%@\", %d, %d)", _TABLENAME1,_NOTE,_MOOD,_DATE,_ADVISOR1,_ADVISOR2   ,[noteToInsert getNote], [noteToInsert getMood], [noteToInsert getDateAsNSString], [noteToInsert getAdvisor1IntValue] ,[noteToInsert getAdvisor2IntValue]];
        NSString* insertSQL = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@) VALUES (\"%@\", %i, \"%@\", %i, %i)", _TABLENAME1,_NOTE,_MOOD,_DATE,_ADVISOR1,_ADVISOR2   ,[noteToInsert getNote], [noteToInsert getMood], [noteToInsert getDateAsNSString], [noteToInsert getAdvisor1IntValue] ,[noteToInsert getAdvisor2IntValue]];
        const char* insert_statement = [insertSQL UTF8String];
        
        //testing
        NSString* mytestt = [NSString stringWithUTF8String:insert_statement];
        NSLog(@"%@",mytestt);
        
        
        if(sqlite3_prepare_v2(_db, insert_statement, -1, &statement, NULL) == SQLITE_OK){
            if(sqlite3_step(statement) == SQLITE_DONE){
                //[self showUIAlertWithMessage:@"User added to the db" andTitle: @"SQLite3"];
                NSLog(@"Note added to db");
                returnMsg = @"Note Added to db";
            }else{
                //[self showUIAlertWithMessage:@"Failed to add the user" andTitle: @"SQLite3"];
                NSLog(@"Failed to add note to db");
                returnMsg = @"Failed to add note to db";
            }
            
        }else{
            NSLog(@"error at INSERT sql statment");
            returnMsg = @"error at INSERT sql statment";
        }
        // close connection to db
        sqlite3_finalize(statement);
        sqlite3_close(_db);
    }else{
        NSLog(@"Could not open connection to db INSERT");
        returnMsg = @"Could not open connection to db INSERT";
    }
    return returnMsg;
}



- (NSString*)updateNote:(id)noteToUpdate{
    sqlite3_stmt* statement;
    NSString* returnMsg = [[NSString alloc]init];
    _dbPath = [_databasePath UTF8String];  // include this to rest
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){
        //tableName
        
        //_ADVISOR1
        //advisor1
        
        //_ADVISOR2
        //advisor2
        
        // _ID column name
        // note id
        
        NSString* updateSQL = [NSString stringWithFormat:@"UPDATE %@  SET %@ = %d, %@ = %d  Where %@ = %d",_TABLENAME1,_ADVISOR1,[noteToUpdate getAdvisor1IntValue],_ADVISOR2, [noteToUpdate getAdvisor2IntValue], _ID,[noteToUpdate getId]];
        const char* update_statement = [updateSQL UTF8String];
        if(sqlite3_prepare_v2(_db, update_statement, -1, &statement, NULL) == SQLITE_OK){
            if(sqlite3_step(statement) == SQLITE_DONE){
                //[self showUIAlertWithMessage:@"User added to the db" andTitle: @"SQLite3"];
                NSLog(@"Note updated in db");
                returnMsg = @"Note updated in db";
            }else{
                //[self showUIAlertWithMessage:@"Failed to add the user" andTitle: @"SQLite3"];
                NSLog(@"Failed to update note in db");
                returnMsg = @"Failed to update note in db";
            }
            
        }else{
            NSLog(@"error at UPDATE sql statment");
            returnMsg = @"error at UPDATE sql statment";
        }
        // close connection to db
        sqlite3_finalize(statement);
        sqlite3_close(_db);
    }else{
        NSLog(@"Could not open connection to db UPDATE");
        returnMsg = @"Could not open connection to db UPDATE";
    }
    return returnMsg;
}



- (NSString*)deleteNote:(id)noteToDelete{
    sqlite3_stmt* statement;
    NSString* returnMsg = [[NSString alloc]init];
    _dbPath = [_databasePath UTF8String];
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){
        //tableName
        //_ID
        // note id
        
        NSString* updateSQL = [NSString stringWithFormat:@"DELETE from %@ where %@ = %d",_TABLENAME1,_ID,[noteToDelete getId]];
        const char* update_statement = [updateSQL UTF8String];
        if(sqlite3_prepare_v2(_db, update_statement, -1, &statement, NULL) == SQLITE_OK){
            if(sqlite3_step(statement) == SQLITE_DONE){
                //[self showUIAlertWithMessage:@"User added to the db" andTitle: @"SQLite3"];
                NSLog(@"Note deleted from db");
                returnMsg = @"Note deleted from db";
            }else{
                //[self showUIAlertWithMessage:@"Failed to add the user" andTitle: @"SQLite3"];
                NSLog(@"Failed to delete note in db");
                returnMsg = @"Failed to delete note in db";
            }
            
        }else{
            NSLog(@"error at DELETE sql statment");
            returnMsg = @"error at DELETE sql statment";
        }
        // close connection to db
        sqlite3_finalize(statement);
        sqlite3_close(_db);
    }else{
        NSLog(@"Could not open connection to db DELETE");
        returnMsg = @"Could not open connection to db DELETE";
    }
    return returnMsg;
}
//*****************************************





//*************** GET NOTES METHODS *************

- (NSArray *)getNotesAllNotesByRecent{
    NSMutableArray* noteHolder = [[NSMutableArray alloc]init];
    _dbPath = [_databasePath UTF8String];
    sqlite3_stmt *stmt = NULL;
    int error = 0;
    
    //_tableName1
    // DATE column as type text into date funtion expects yyyy/MM/dd
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){      // gotta fix this so it reads by date desc
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY datetime(%@) DESC",_TABLENAME1,_DATE];
        const char* queryStatement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_db, queryStatement, -1, &stmt, NULL) == SQLITE_OK ){
            
            if (error != SQLITE_OK) {
                NSLog(@"prepare failed: %s", sqlite3_errmsg(_db));
            }else{
                
                //set up date formater
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];

                for (;;) {
                    error = sqlite3_step(stmt);
                    if (error != SQLITE_ROW){
                        break;
                    }
                    
                    //getId
                    int id = sqlite3_column_int (stmt, 0);
                    //getNote
                    const unsigned char* noteDb = sqlite3_column_text(stmt, 1);
                    NSString* note = [NSString stringWithUTF8String:(char*)noteDb];
                    //getmood
                    int mood = sqlite3_column_int (stmt, 2);
                    //getDate
                    const unsigned char* dateDb = sqlite3_column_text(stmt, 3);
                    NSString* dateStr = [NSString stringWithUTF8String:(char*)dateDb];
                    NSDate* date = [formatter dateFromString:dateStr];
                    //getAdvisor1
                    int advisor1db = sqlite3_column_int(stmt, 4);
                    //getAdvisor2
                    int advisor2db = sqlite3_column_int(stmt, 5);
                    
                    //convert advisors vals to bool
                    bool advisor1 = advisor1db;
                    bool advisor2 = advisor2db;
                    
                    //create a temp note objecty
                    Note* myNote = [[Note alloc]initWithNote:note moodValue:mood date:date advisor1:advisor1 Advisor2:advisor2 andId:id];
                    
                    //append to holder array
                    [noteHolder addObject:myNote];
                }

                if (error != SQLITE_DONE) {
                    NSLog(@"execution failed: %s", sqlite3_errmsg(_db));
                }
            }
        }else{
            NSLog(@"error at sql statment getNotesAllNotesByRecent");
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);

    }else{
        NSLog(@"Could not open connection to db getNotesAllByRecent");
    }
    
    return noteHolder;
}



- (NSArray *)getNotesRecent:(int)numNotes{
    NSMutableArray* noteHolder = [[NSMutableArray alloc]init];
    _dbPath = [_databasePath UTF8String];
    sqlite3_stmt *stmt = NULL;
    int error = 0;
    
    //_tableName1
    // numNotes
    // _DATE
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){      // gotta fix this so it reads by date desc
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY datetime(%@) DESC Limit %d",_TABLENAME1,_DATE,numNotes];
        const char* queryStatement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_db, queryStatement, -1, &stmt, NULL) == SQLITE_OK ){
            
            if (error != SQLITE_OK) {
                NSLog(@"prepare failed: %s", sqlite3_errmsg(_db));
            }else{
                
                //set up date formater
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];

                for (;;) {
                    error = sqlite3_step(stmt);
                    if (error != SQLITE_ROW){
                        break;
                    }
                    
                    //getId
                    int id = sqlite3_column_int (stmt, 0);
                    //getNote
                    const unsigned char* noteDb = sqlite3_column_text(stmt, 1);
                    NSString* note = [NSString stringWithUTF8String:(char*)noteDb];
                    //getmood
                    int mood = sqlite3_column_int (stmt, 2);
                    //getDate
                    const unsigned char* dateDb = sqlite3_column_text(stmt, 3);
                    NSString* dateStr = [NSString stringWithUTF8String:(char*)dateDb];
                    NSDate* date =  [formatter dateFromString:dateStr];
                    //getAdvisor1
                    int advisor1db = sqlite3_column_int(stmt, 4);
                    //getAdvisor2
                    int advisor2db = sqlite3_column_int(stmt, 5);
                    
                    //convert advisors vals to bool
                    bool advisor1 = advisor1db;
                    bool advisor2 = advisor2db;
                    
                    //create a temp note objecty
                    Note* myNote = [[Note alloc]initWithNote:note moodValue:mood date:date advisor1:advisor1 Advisor2:advisor2 andId:id];
                    
                    //append to holder array
                    [noteHolder addObject:myNote];
                }

                if (error != SQLITE_DONE) {
                    NSLog(@"execution failed: %s", sqlite3_errmsg(_db));
                }
            }
        }else{
            NSLog(@"error at sql statment getNotesRecent");
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);

    }else{
        NSLog(@"Could not open connection to db getNotesRecent");
    }
    
    return noteHolder;
}



- (NSArray *)getNotesGood{
    NSMutableArray* noteHolder = [[NSMutableArray alloc]init];
    _dbPath = [_databasePath UTF8String];
    sqlite3_stmt *stmt = NULL;
    int error = 0;
    
    //_tableName1
    //_MOOD
    // > 6
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){      // gotta fix this so it reads by date desc
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM %@ Where %@ > 6",_TABLENAME1,_MOOD];
        const char* queryStatement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_db, queryStatement, -1, &stmt, NULL) == SQLITE_OK ){
            
            if (error != SQLITE_OK) {
                NSLog(@"prepare failed: %s", sqlite3_errmsg(_db));
            }else{
                
                //set up date formater
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];

                for (;;) {
                    error = sqlite3_step(stmt);
                    if (error != SQLITE_ROW){
                        break;
                    }
                    
                    //getId
                    int id = sqlite3_column_int (stmt, 0);
                    //getNote
                    const unsigned char* noteDb = sqlite3_column_text(stmt, 1);
                    NSString* note = [NSString stringWithUTF8String:(char*)noteDb];
                    //getmood
                    int mood = sqlite3_column_int (stmt, 2);
                    //getDate
                    const unsigned char* dateDb = sqlite3_column_text(stmt, 3);
                    NSString* dateStr = [NSString stringWithUTF8String:(char*)dateDb];
                    NSDate* date =  [formatter dateFromString:dateStr];
                    //getAdvisor1
                    int advisor1db = sqlite3_column_int(stmt, 4);
                    //getAdvisor2
                    int advisor2db = sqlite3_column_int(stmt, 5);
                    
                    //convert advisors vals to bool
                    bool advisor1 = advisor1db;
                    bool advisor2 = advisor2db;
                    
                    //create a temp note objecty
                    Note* myNote = [[Note alloc]initWithNote:note moodValue:mood date:date advisor1:advisor1 Advisor2:advisor2 andId:id];
                    
                    //append to holder array
                    [noteHolder addObject:myNote];
                }

                if (error != SQLITE_DONE) {
                    NSLog(@"execution failed: %s", sqlite3_errmsg(_db));
                }
            }
        }else{
            NSLog(@"error at sql statment getNotesGood");
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);

    }else{
        NSLog(@"Could not open connection to db getNotesGood");
    }
    
    return noteHolder;
}



- (NSArray *)getNotesAverage{
    NSMutableArray* noteHolder = [[NSMutableArray alloc]init];
    _dbPath = [_databasePath UTF8String];
    sqlite3_stmt *stmt = NULL;
    int error = 0;
    
    //_tableName1
    //_MOOD
    // 5 or 6
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){      // gotta fix this so it reads by date desc    //between 4 and 7 should get me where val = 5 or 6
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM %@ Where %@ BETWEEN 4 AND 7",_TABLENAME1,_MOOD];
        const char* queryStatement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_db, queryStatement, -1, &stmt, NULL) == SQLITE_OK ){
            
            if (error != SQLITE_OK) {
                NSLog(@"prepare failed: %s", sqlite3_errmsg(_db));
            }else{
                
                //set up date formater
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];

                for (;;) {
                    error = sqlite3_step(stmt);
                    if (error != SQLITE_ROW){
                        break;
                    }
                    
                    //getId
                    int id = sqlite3_column_int (stmt, 0);
                    //getNote
                    const unsigned char* noteDb = sqlite3_column_text(stmt, 1);
                    NSString* note = [NSString stringWithUTF8String:(char*)noteDb];
                    //getmood
                    int mood = sqlite3_column_int (stmt, 2);
                    //getDate
                    const unsigned char* dateDb = sqlite3_column_text(stmt, 3);
                    NSString* dateStr = [NSString stringWithUTF8String:(char*)dateDb];
                    NSDate* date =  [formatter dateFromString:dateStr];
                    //getAdvisor1
                    int advisor1db = sqlite3_column_int(stmt, 4);
                    //getAdvisor2
                    int advisor2db = sqlite3_column_int(stmt, 5);
                    
                    //convert advisors vals to bool
                    bool advisor1 = advisor1db;
                    bool advisor2 = advisor2db;
                    
                    //create a temp note objecty
                    Note* myNote = [[Note alloc]initWithNote:note moodValue:mood date:date advisor1:advisor1 Advisor2:advisor2 andId:id];
                    
                    //append to holder array
                    [noteHolder addObject:myNote];
                }

                if (error != SQLITE_DONE) {
                    NSLog(@"execution failed: %s", sqlite3_errmsg(_db));
                }
            }
        }else{
            NSLog(@"error at sql statment getNotesAverage");
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);

    }else{
        NSLog(@"Could not open connection to db getNotesAverage");
    }
    
    return noteHolder;
}



- (NSArray *)getNotesWorse{
    NSMutableArray* noteHolder = [[NSMutableArray alloc]init];
    _dbPath = [_databasePath UTF8String];
    sqlite3_stmt *stmt = NULL;
    int error = 0;
    
    //_tableName1
    //_MOOD
    // <=4
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){      // gotta fix this so it reads by date desc
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM %@ Where %@ <= 4",_TABLENAME1,_MOOD];
        const char* queryStatement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_db, queryStatement, -1, &stmt, NULL) == SQLITE_OK ){
            
            if (error != SQLITE_OK) {
                NSLog(@"prepare failed: %s", sqlite3_errmsg(_db));
            }else{
                
                //set up date formater
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];

                for (;;) {
                    error = sqlite3_step(stmt);
                    if (error != SQLITE_ROW){
                        break;
                    }
                    
                    //getId
                    int id = sqlite3_column_int (stmt, 0);
                    //getNote
                    const unsigned char* noteDb = sqlite3_column_text(stmt, 1);
                    NSString* note = [NSString stringWithUTF8String:(char*)noteDb];
                    //getmood
                    int mood = sqlite3_column_int (stmt, 2);
                    //getDate
                    const unsigned char* dateDb = sqlite3_column_text(stmt, 3);
                    NSString* dateStr = [NSString stringWithUTF8String:(char*)dateDb];
                    NSDate* date =  [formatter dateFromString:dateStr];
                    //getAdvisor1
                    int advisor1db = sqlite3_column_int(stmt, 4);
                    //getAdvisor2
                    int advisor2db = sqlite3_column_int(stmt, 5);
                    
                    //convert advisors vals to bool
                    bool advisor1 = advisor1db;
                    bool advisor2 = advisor2db;
                    
                    //create a temp note objecty
                    Note* myNote = [[Note alloc]initWithNote:note moodValue:mood date:date advisor1:advisor1 Advisor2:advisor2 andId:id];
                    
                    //append to holder array
                    [noteHolder addObject:myNote];
                }

                if (error != SQLITE_DONE) {
                    NSLog(@"execution failed: %s", sqlite3_errmsg(_db));
                }
            }
        }else{
            NSLog(@"error at sql statment getNotesWorse");
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);

    }else{
        NSLog(@"Could not open connection to db getNotesWorse");
    }
    
    return noteHolder;
}




- (NSArray *)getNotesAdvisor1{
    NSMutableArray* noteHolder = [[NSMutableArray alloc]init];
    _dbPath = [_databasePath UTF8String];
    sqlite3_stmt *stmt = NULL;
    int error = 0;
    
    //_tableName1
    //_ADVISOR1 == true/1
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){      // gotta fix this so it reads by date desc
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM %@ Where %@ = 1",_TABLENAME1,_ADVISOR1];
        const char* queryStatement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_db, queryStatement, -1, &stmt, NULL) == SQLITE_OK ){
            
            if (error != SQLITE_OK) {
                NSLog(@"prepare failed: %s", sqlite3_errmsg(_db));
            }else{
                
                //set up date formater
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];

                for (;;) {
                    error = sqlite3_step(stmt);
                    if (error != SQLITE_ROW){
                        break;
                    }
                    
                    //getId
                    int id = sqlite3_column_int (stmt, 0);
                    //getNote
                    const unsigned char* noteDb = sqlite3_column_text(stmt, 1);
                    NSString* note = [NSString stringWithUTF8String:(char*)noteDb];
                    //getmood
                    int mood = sqlite3_column_int (stmt, 2);
                    //getDate
                    const unsigned char* dateDb = sqlite3_column_text(stmt, 3);
                    NSString* dateStr = [NSString stringWithUTF8String:(char*)dateDb];
                    NSDate* date =  [formatter dateFromString:dateStr];
                    //getAdvisor1
                    int advisor1db = sqlite3_column_int(stmt, 4);
                    //getAdvisor2
                    int advisor2db = sqlite3_column_int(stmt, 5);
                    
                    //convert advisors vals to bool
                    bool advisor1 = advisor1db;
                    bool advisor2 = advisor2db;
                    
                    //create a temp note objecty
                    Note* myNote = [[Note alloc]initWithNote:note moodValue:mood date:date advisor1:advisor1 Advisor2:advisor2 andId:id];
                    
                    //append to holder array
                    [noteHolder addObject:myNote];
                }

                if (error != SQLITE_DONE) {
                    NSLog(@"execution failed: %s", sqlite3_errmsg(_db));
                }
            }
        }else{
            NSLog(@"error at sql statment getAdvisor1");
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);

    }else{
        NSLog(@"Could not open connection to db getAdvisor1");
    }
    
    return noteHolder;
}




- (NSArray *)getNotesAdvisor2{
    NSMutableArray* noteHolder = [[NSMutableArray alloc]init];
    _dbPath = [_databasePath UTF8String];
    sqlite3_stmt *stmt = NULL;
    int error = 0;
    
    //_tableName1
    //_ADVISOR2 == true/1
    
    if(sqlite3_open(_dbPath, &_db) == SQLITE_OK){      // gotta fix this so it reads by date desc
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM %@ Where %@ = 1",_TABLENAME1,_ADVISOR2];
        const char* queryStatement = [querySQL UTF8String];
        
        if(sqlite3_prepare_v2(_db, queryStatement, -1, &stmt, NULL) == SQLITE_OK ){
            
            if (error != SQLITE_OK) {
                NSLog(@"prepare failed: %s", sqlite3_errmsg(_db));
            }else{
                
                //set up date formater
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];

                for (;;) {
                    error = sqlite3_step(stmt);
                    if (error != SQLITE_ROW){
                        break;
                    }
                    
                    //getId
                    int id = sqlite3_column_int (stmt, 0);
                    //getNote
                    const unsigned char* noteDb = sqlite3_column_text(stmt, 1);
                    NSString* note = [NSString stringWithUTF8String:(char*)noteDb];
                    //getmood
                    int mood = sqlite3_column_int (stmt, 2);
                    //getDate
                    const unsigned char* dateDb = sqlite3_column_text(stmt, 3);
                    NSString* dateStr = [NSString stringWithUTF8String:(char*)dateDb];
                    NSDate* date =  [formatter dateFromString:dateStr];
                    //getAdvisor1
                    int advisor1db = sqlite3_column_int(stmt, 4);
                    //getAdvisor2
                    int advisor2db = sqlite3_column_int(stmt, 5);
                    
                    //convert advisors vals to bool
                    bool advisor1 = advisor1db;
                    bool advisor2 = advisor2db;
                    
                    //create a temp note objecty
                    Note* myNote = [[Note alloc]initWithNote:note moodValue:mood date:date advisor1:advisor1 Advisor2:advisor2 andId:id];
                    
                    //append to holder array
                    [noteHolder addObject:myNote];
                }

                if (error != SQLITE_DONE) {
                    NSLog(@"execution failed: %s", sqlite3_errmsg(_db));
                }
            }
        }else{
            NSLog(@"error at sql statment getAdvisor2");
        }
        sqlite3_finalize(stmt);
        sqlite3_close(_db);

    }else{
        NSLog(@"Could not open connection to db getAdvisor2");
    }
    
    return noteHolder;
}

//****************************************



@end


