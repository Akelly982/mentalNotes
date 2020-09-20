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





// update db data
- (void)updateAccountExists:(bool)myAccountBool{
    [_myDb updateAccountExists:myAccountBool];
}

- (void)updateAccountPin:(int)myPin{
    
}

- (void)updateAccountEmail:(NSString *)userEmail{
    
}



//getter
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
