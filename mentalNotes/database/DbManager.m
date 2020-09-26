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
    }
    return self;
}


//**********GETNOTES*******************************

- (NSArray *)getNotes{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    myArray = [_myDb getNotes];
    
    
    return myArray;
}

- (NSArray*) getNotesRecent : (int) numItems{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    myArray = [_myDb getNotesRecent:numItems];
    
    return myArray;
}

- (NSArray *)getNotesGood{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    myArray = [_myDb getNotesGood];
    
    
    return myArray;
}

- (NSArray *)getNotesAverage{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    myArray = [_myDb getNotesAverage];
    
    
    return myArray;
}

- (NSArray *)getNotesWorse{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    myArray = [_myDb getNotesWorse];
    
    
    return myArray;
}

- (NSArray *)getNotesAdvisor1{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    myArray = [_myDb getNotesAdvisor1];
    
    
    return myArray;
}

- (NSArray *)getNotesAdvisor2{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp Db
    myArray = [_myDb getNotesAdvisor2];
    
    
    return myArray;
}

//************************************************




// add New Note
- (void)addNote:(Note *)noteToAdd{
    [_myDb addNote:noteToAdd];
}


//update note
- (void)updateNote:(Note *)noteToUpdate{
    [_myDb updateNote:noteToUpdate];
}


//delete note
- (void)deleteNote:(Note *)noteToDelete{
    [_myDb deleteNote:noteToDelete];
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
