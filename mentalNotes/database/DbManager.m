//
//  DbManager.m
//  mentalNotes
//
//  Created by Aidan Kelly on 18/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "DbManager.h"

@implementation DbManager


// taking control of base init to create base db object on init of DbManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _myDb = [[TempDb alloc]init];
        _sqlDb = [[MySQLDatabase alloc]init];
    }
    return self;
}


//**********GETNOTES*******************************

- (NSArray *)getNotes{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    //myArray = [_myDb getNotes];
    
    myArray = [_sqlDb getNotesAllNotesByRecent];
    
    return myArray;
}

- (NSArray*) getNotesRecent : (int) numItems{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    //myArray = [_myDb getNotesRecent:numItems];
    
    myArray = [_sqlDb getNotesRecent:numItems];
    
    return myArray;
}

- (NSArray *)getNotesGood{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    //myArray = [_myDb getNotesGood];
    
    myArray = [_sqlDb getNotesGood];
    
    return myArray;
}

- (NSArray *)getNotesAverage{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    //myArray = [_myDb getNotesAverage];
    
    myArray = [_sqlDb getNotesAverage];
    
    return myArray;
}

- (NSArray *)getNotesWorse{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    //myArray = [_myDb getNotesWorse];
    
    myArray = [_sqlDb getNotesWorse];
    
    return myArray;
}

- (NSArray *)getNotesAdvisor1{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    //myArray = [_myDb getNotesAdvisor1];
    
    myArray = [_sqlDb getNotesAdvisor1];
    
    return myArray;
}

- (NSArray *)getNotesAdvisor2{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    //myArray = [_myDb getNotesAdvisor2];
    
    myArray = [_sqlDb getNotesAdvisor2];
    
    return myArray;
}

//************************************************




// add New Note
- (NSString*)addNote:(Note *)noteToAdd{
    NSString* returnMsg = [[NSString alloc]init];
    //[_myDb addNote:noteToAdd];
    returnMsg = [_sqlDb addNote:noteToAdd];
    return returnMsg;
}


//update note
- (NSString*)updateNote:(Note *)noteToUpdate{
    NSString* returnMsg = [[NSString alloc]init];
    //[_myDb updateNote:noteToUpdate];
    returnMsg = [_sqlDb updateNote:noteToUpdate];
    return returnMsg;
}


//delete note
- (NSString*)deleteNote:(Note *)noteToDelete{
    NSString* returnMsg = [[NSString alloc]init];
    //[_myDb deleteNote:noteToDelete];
    returnMsg = [_sqlDb deleteNote:noteToDelete];
    return returnMsg;
}










//EXCLUDING for ait ios project may add later

// update account
- (void)updateAccountExists:(bool)myAccountBool{
    [_myDb updateAccountExists:myAccountBool];
}

- (void)updateAccountPin:(int)myPin{
    
}

- (void)updateAccountEmail:(NSString *)userEmail{
    
}


//get account
- (BOOL)getAccountExists{
    return [_myDb getAccountExists];
}
- (int)getAccountPin{
    return [_myDb getAccountPin];
}

- (NSString *)getAccountEmail{
    return [_myDb getUserEmail];
}






@end
