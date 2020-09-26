//
//  TempDb.m
//  mentalNotes
//
//  Created by Aidan Kelly on 18/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "TempDb.h"


@implementation TempDb

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        
        _TDatabase = [[NSDictionary alloc]init];
        // for advisors 0==TRUE 1==FALSE
        _TDatabase = @{
            @0 : @{@"id" : @1, @"Note" : @"started project XYZ", @"moodVal": @8 , @"date" : @"08/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @1 : @{@"id" : @2, @"Note" : @"Created a box", @"moodVal": @2 , @"date" : @"02/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @2 : @{@"id" : @3, @"Note" : @"The tree of life", @"moodVal": @5 , @"date" : @"21/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @3 : @{@"id" : @4, @"Note" : @"Tigers are dangerous", @"moodVal": @6 , @"date" : @"22/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @4 : @{@"id" : @5, @"Note" : @"Iron man uses AI JARVIS", @"moodVal": @10 , @"date" : @"23/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @5 : @{@"id" : @6, @"Note" : @"Monkeys can climb like a boss", @"moodVal": @15 , @"date" : @"13/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @6 : @{@"id" : @7, @"Note" : @"Time is the only true mesurment of existance", @"moodVal": @-2 , @"date" : @"14/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @7 : @{@"id" : @8, @"Note" : @"sleeping is for the dead", @"moodVal": @2 , @"date" : @"15/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @8 : @{@"id" : @9, @"Note" : @"All coding languages are quite similar with they just have different syntax", @"moodVal": @8 , @"date" : @"02/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @9 : @{@"id" : @10, @"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"01/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @10 : @{@"id" : @11, @"Note" : @"this is my note", @"moodVal": @11 , @"date" : @"02/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @11 : @{@"id" : @12, @"Note" : @"this is my note", @"moodVal": @5 , @"date" : @"29/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @12 : @{@"id" : @13, @"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"32/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @13 : @{@"id" : @14, @"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"21/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @14 : @{@"id" : @15, @"Note" : @"this is my note", @"moodVal": @6 , @"date" : @"31/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @15 : @{@"id" : @16, @"Note" : @"this is my note", @"moodVal": @3 , @"date" : @"15/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @16 : @{@"id" : @17, @"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"16/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @17 : @{@"id" : @18, @"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"10/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @18 : @{@"id" : @19, @"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"30/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @19 : @{@"id" : @111, @"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"22/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @20 : @{@"id" : @21, @"Note" : @"this is my note", @"moodVal": @3 , @"date" : @"11/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @21 : @{@"id" : @221, @"Note" : @"this is my note", @"moodVal": @5 , @"date" : @"12/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @22 : @{@"id" : @31, @"Note" : @"this is my note", @"moodVal": @6 , @"date" : @"13/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @23 : @{@"id" : @51, @"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"14/03/2020", @"advisor1" : @0, @"advisor2" : @1},
            @24 : @{@"id" : @431, @"Note" : @"this is my note", @"moodVal": @5 , @"date" : @"20/04/2020", @"advisor1" : @0, @"advisor2" : @0},
            @25 : @{@"id" : @112, @"Note" : @"this is my note", @"moodVal": @10 , @"date" : @"20/05/2019", @"advisor1" : @0, @"advisor2" : @0}
        };
        
        
        _accountExists = true;
        _accountPin = 5555;
        _userEmail = @"user@email.com";
    }
    return self;
}



//update
-(void)updateAccountExists:(BOOL)myAccountBool{
    _accountExists = myAccountBool;
}

- (void)updateAccountPin:(int)myPin{
    _accountPin = myPin;
}

- (void)updateUserEmail:(NSString *)myEmail{
    _userEmail = myEmail;
}


//getters
-(BOOL)getAccountExists{
    return _accountExists;
}

- (int)getAccountPin{
    return _accountPin;
}

- (NSString *)getUserEmail{
    return _userEmail;
}

//****************** GET NOTES ****************************************************************

- (NSArray*) getNotes{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
        NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
        int myId = [[self TDatabase][currentIndex][@"id"]intValue];
        
        //get NS date from string
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
        
        //getAdvisorVal
        // I did it this way because i could not direclty use 0 and 1 to set bool value for some reason..
        NSNumber* myBoolNum1 = [self TDatabase][currentIndex][@"advisor1"];
        NSNumber* myBoolNum2 = [self TDatabase][currentIndex][@"advisor2"];
        //initiate bool values
        bool myAdvisor1 = FALSE;
        bool myAdvisor2 = FALSE;
        
        // check their values
        if([myBoolNum1 isEqual: @0]){
            myAdvisor1 = TRUE;
        }
        if([myBoolNum2 isEqual: @0]){
            myAdvisor2 = TRUE;
        }
        
        // advisor bool testing
//        if(myAdvisor1){
//            NSLog(@"advisor1 == true");
//        }else{
//            NSLog(@"advisor1 == false");
//        }
        
        //Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
        Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 Advisor2:myAdvisor2 andId:myId];
        
        [holderArray addObject:myNoteObj];
        currentIndex = nil;  // this should remove it from memory
    }
    myArray = holderArray;
    return myArray;
}




- (NSArray*) getNotesRecent : (int) numNotes{   // to do this properly when using correct real db get by date desc/asc
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    
    //check to ensure numNotes is not larger than dataBase set
    if (numNotes > [_TDatabase count]){
        numNotes = (int)[_TDatabase count];   //set num Notes to len notes //(casting int)
    }
    
    
    // use num notes to determine how many we get
    for (int i = 0; i<= numNotes; i++ ){   //decrement from end
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
        NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
        int myId = [[self TDatabase][currentIndex][@"id"]intValue];
        
        //get NS date from string
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
        
        //getAdvisorVal
        // I did it this way because i could not direclty use 0 and 1 to set bool value for some reason..
        NSNumber* myBoolNum1 = [self TDatabase][currentIndex][@"advisor1"];
        NSNumber* myBoolNum2 = [self TDatabase][currentIndex][@"advisor2"];
        //initiate bool values
        bool myAdvisor1 = FALSE;
        bool myAdvisor2 = FALSE;
        
        // check their values
        if([myBoolNum1 isEqual: @0]){
            myAdvisor1 = TRUE;
        }
        if([myBoolNum2 isEqual: @0]){
            myAdvisor2 = TRUE;
        }
        

        
        //Create Note Object
        Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 Advisor2:myAdvisor2 andId:myId];
        [holderArray addObject:myNoteObj];
        currentIndex = nil;  // this should remove it from memory
    }
    
    
    myArray = holderArray;
    return myArray;
}

- (NSArray*) getNotesGood{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        int moodValue = [[self TDatabase][currentIndex][@"moodVal"] intValue];
        
        if (moodValue > 6){ //mood value == good
            int myId = [[self TDatabase][currentIndex][@"id"]intValue];
            NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
            NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
            
            //get NS date from string
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"dd/MM/yyyy"];
            NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
            
            //getAdvisorVal
            // I did it this way because i could not direclty use 0 and 1 to set bool value for some reason..
            NSNumber* myBoolNum1 = [self TDatabase][currentIndex][@"advisor1"];
            NSNumber* myBoolNum2 = [self TDatabase][currentIndex][@"advisor2"];
            //initiate bool values
            bool myAdvisor1 = FALSE;
            bool myAdvisor2 = FALSE;
            
            // check their values
            if([myBoolNum1 isEqual: @0]){
                myAdvisor1 = TRUE;
            }
            if([myBoolNum2 isEqual: @0]){
                myAdvisor2 = TRUE;
            }
            
            
            //Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
            Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 Advisor2:myAdvisor2 andId:myId];
            
            [holderArray addObject:myNoteObj];
            currentIndex = nil;  // this should remove it from memory
        }else{
            continue;
        }
        
    }
    myArray = holderArray;
    return myArray;
}

- (NSArray*) getNotesAverage{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        int moodValue = [[self TDatabase][currentIndex][@"moodVal"] intValue];
        
        if (moodValue == 6 || moodValue  == 5){ //mood value == average
            int myId = [[self TDatabase][currentIndex][@"id"]intValue];
            NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
            NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
            
            //get NS date from string
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"dd/MM/yyyy"];
            NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
            
            //getAdvisorVal
            // I did it this way because i could not direclty use 0 and 1 to set bool value for some reason..
            NSNumber* myBoolNum1 = [self TDatabase][currentIndex][@"advisor1"];
            NSNumber* myBoolNum2 = [self TDatabase][currentIndex][@"advisor2"];
            //initiate bool values
            bool myAdvisor1 = FALSE;
            bool myAdvisor2 = FALSE;
            
            // check their values
            if([myBoolNum1 isEqual: @0]){
                myAdvisor1 = TRUE;
            }
            if([myBoolNum2 isEqual: @0]){
                myAdvisor2 = TRUE;
            }
            
            
            //Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
            Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 Advisor2:myAdvisor2 andId:myId];
            
            [holderArray addObject:myNoteObj];
            currentIndex = nil;  // this should remove it from memory
        }else{
            continue;
        }
        
    }
    myArray = holderArray;
    return myArray;
}

- (NSArray*) getNotesWorse{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        int moodValue = [[self TDatabase][currentIndex][@"moodVal"] intValue];
        
        if (moodValue <= 4){ //mood value == worse
            int myId = [[self TDatabase][currentIndex][@"id"]intValue];
            NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
            NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
            
            //get NS date from string
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"dd/MM/yyyy"];
            NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
            
            //getAdvisorVal
            // I did it this way because i could not direclty use 0 and 1 to set bool value for some reason..
            NSNumber* myBoolNum1 = [self TDatabase][currentIndex][@"advisor1"];
            NSNumber* myBoolNum2 = [self TDatabase][currentIndex][@"advisor2"];
            //initiate bool values
            bool myAdvisor1 = FALSE;
            bool myAdvisor2 = FALSE;
            
            // check their values
            if([myBoolNum1 isEqual: @0]){
                myAdvisor1 = TRUE;
            }
            if([myBoolNum2 isEqual: @0]){
                myAdvisor2 = TRUE;
            }
            
            
            //Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
            Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 Advisor2:myAdvisor2 andId:myId];
            
            [holderArray addObject:myNoteObj];
            currentIndex = nil;  // this should remove it from memory
        }else{
            continue;
        }
        
    }
    myArray = holderArray;
    return myArray;
}



- (NSArray*) getNotesAdvisor1{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        
        //check Advisor1
        NSNumber* myBoolNum1 = [self TDatabase][currentIndex][@"advisor1"];
        bool myAdvisor1 = FALSE; //set to false
        if([myBoolNum1 isEqual: @0]){  // if not false change
            myAdvisor1 = TRUE;
        }
        
        if (myAdvisor1){ //if set for advisor 1
            int myId = [[self TDatabase][currentIndex][@"id"]intValue];
            NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
            NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
            
            //get NS date from string
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"dd/MM/yyyy"];
            NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
            
            //getAdvisorVal2
            // I did it this way because i could not direclty use 0 and 1 to set bool value for some reason..
            NSNumber* myBoolNum2 = [self TDatabase][currentIndex][@"advisor2"];
            //initiate bool values
            bool myAdvisor2 = FALSE;
            
            // check its values
            if([myBoolNum2 isEqual: @0]){
                myAdvisor2 = TRUE;
            }
            
            
            //Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
            Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 Advisor2:myAdvisor2 andId:myId];
            
            [holderArray addObject:myNoteObj];
            currentIndex = nil;  // this should remove it from memory
        }else{
            continue;
        }
        
    }
    myArray = holderArray;
    return myArray;
}




- (NSArray*) getNotesAdvisor2{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        
        //check Advisor2
        NSNumber* myBoolNum2 = [self TDatabase][currentIndex][@"advisor2"];
        bool myAdvisor2 = FALSE; //set to false
        if([myBoolNum2 isEqual: @0]){  // if not false change
            myAdvisor2 = TRUE;
        }
        
        if (myAdvisor2){ //if set for advisor 2
            int myId = [[self TDatabase][currentIndex][@"id"]intValue];
            NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
            NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
            
            //get NS date from string
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"dd/MM/yyyy"];
            NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
            
            //getAdvisorVal1
            // I did it this way because i could not direclty use 0 and 1 to set bool value for some reason..
            NSNumber* myBoolNum1 = [self TDatabase][currentIndex][@"advisor1"];
            //initiate bool values
            bool myAdvisor1 = FALSE;
            // check their values
            if([myBoolNum1 isEqual: @0]){
                myAdvisor1 = TRUE;
            }

            
            
            //Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
            Note* myNoteObj =[[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 Advisor2:myAdvisor2 andId:myId];
            
            [holderArray addObject:myNoteObj];
            currentIndex = nil;  // this should remove it from memory
        }else{
            continue;
        }
        
    }
    myArray = holderArray;
    return myArray;
}



//*****************NOTE TO UPDATE INSERT DELETE**********************************************************


//add note    //just prints in fake db because _TDataBases is not part of the class so is recreated with each init  (I tried it was difficult)
- (void)addNote:(Note *)noteToInsert{
    
    // get what my next id should be
    NSNumber* myIdNum = [[NSNumber alloc]initWithInt:(int)[_TDatabase count] + 1];
    int myId = [myIdNum intValue];
    
    NSLog(@"Note added to db");
    NSLog(@"noteId : %i", myId);
    NSLog(@"Note : %@", [noteToInsert getNote]);
    NSLog(@"moodVal: %i",[noteToInsert getMood]);
    NSLog(@"date: %@",[noteToInsert getDateAsNSString]);
    NSLog(@"advisor1: %@",[noteToInsert getAdvisor1] ? @"True" : @"False");  //shorthand if:else
    NSLog(@"advisor2: %@",[noteToInsert getAdvisor2] ? @"True" : @"False");
    
    
}


- (void)updateNote:(Note *)noteToUpdate{
    NSLog(@"Note to update in db");
    NSLog(@"noteId : %i", [noteToUpdate getId]);
    NSLog(@"Note : %@", [noteToUpdate getNote]);
    NSLog(@"moodVal: %i",[noteToUpdate getMood]);
    NSLog(@"date: %@",[noteToUpdate getDateAsNSString]);
    NSLog(@"advisor1: %@",[noteToUpdate getAdvisor1] ? @"True" : @"False");  //shorthand if:else
    NSLog(@"advisor2: %@",[noteToUpdate getAdvisor2] ? @"True" : @"False");
}


- (void)deleteNote:(Note *)noteToDelete{
    NSLog(@"Note to delete in db");
    NSLog(@"noteId : %i", [noteToDelete getId]);
    NSLog(@"Note : %@", [noteToDelete getNote]);
    NSLog(@"moodVal: %i",[noteToDelete getMood]);
    NSLog(@"date: %@",[noteToDelete getDateAsNSString]);
    NSLog(@"advisor1: %@",[noteToDelete getAdvisor1] ? @"True" : @"False");  //shorthand if:else
    NSLog(@"advisor2: %@",[noteToDelete getAdvisor2] ? @"True" : @"False");
}


//********************************************************************************************************


@end



