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
            @0 : @{@"Note" : @"started project XYZ", @"moodVal": @8 , @"date" : @"08/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @1 : @{@"Note" : @"Created a box", @"moodVal": @2 , @"date" : @"02/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @2 : @{@"Note" : @"The tree of life", @"moodVal": @3 , @"date" : @"21/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @3 : @{@"Note" : @"Tigers are dangerous", @"moodVal": @6 , @"date" : @"22/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @4 : @{@"Note" : @"Iron man uses AI JARVIS", @"moodVal": @10 , @"date" : @"23/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @5 : @{@"Note" : @"Monkeys can climb like a boss", @"moodVal": @15 , @"date" : @"13/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @6 : @{@"Note" : @"Time is the only true mesurment of existance", @"moodVal": @-2 , @"date" : @"14/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @7 : @{@"Note" : @"sleeping is for the dead", @"moodVal": @2 , @"date" : @"15/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @8 : @{@"Note" : @"All coding languages are quite similar with they just have different syntax", @"moodVal": @8 , @"date" : @"02/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @9 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"01/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @10 : @{@"Note" : @"this is my note", @"moodVal": @11 , @"date" : @"02/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @11 : @{@"Note" : @"this is my note", @"moodVal": @5 , @"date" : @"29/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @12 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"32/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @13 : @{@"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"21/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @14 : @{@"Note" : @"this is my note", @"moodVal": @6 , @"date" : @"31/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @15 : @{@"Note" : @"this is my note", @"moodVal": @3 , @"date" : @"15/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @16 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"16/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @17 : @{@"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"10/02/2020", @"advisor1" : @1, @"advisor2" : @0},
            @18 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"30/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @19 : @{@"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"22/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @20 : @{@"Note" : @"this is my note", @"moodVal": @3 , @"date" : @"11/02/2020", @"advisor1" : @0, @"advisor2" : @0},
            @21 : @{@"Note" : @"this is my note", @"moodVal": @5 , @"date" : @"12/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @22 : @{@"Note" : @"this is my note", @"moodVal": @6 , @"date" : @"13/02/2020", @"advisor1" : @0, @"advisor2" : @1},
            @23 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"14/03/2020", @"advisor1" : @0, @"advisor2" : @1},
            @24 : @{@"Note" : @"this is my note", @"moodVal": @9 , @"date" : @"20/04/2020", @"advisor1" : @0, @"advisor2" : @0},
            @25 : @{@"Note" : @"this is my note", @"moodVal": @10 , @"date" : @"20/05/2019", @"advisor1" : @0, @"advisor2" : @0}
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



- (NSArray*) getNotes{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
        NSNumber* myMood = [self TDatabase][currentIndex][@"moodVal"];
        
        //get NS date from string
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        NSDate* myDate =  [formatter dateFromString:_TDatabase[currentIndex][@"date"]];
        
        //getAdvisorVal
        bool myAdvisor1 = [self TDatabase][currentIndex][@"advisor1"];
        bool myAdvisor2 = [self TDatabase][currentIndex][@"advisor2"];
        
        // advisor bool testing
//        if(myAdvisor1){
//            NSLog(@"advisor1 == true");
//        }else{
//            NSLog(@"advisor1 == false");
//        }
        
        //Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
        Note* myNoteObj =[[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 andAdvisor2:myAdvisor2];
        
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
        
        // testing if bool values where set correctly
//        if(myAdvisor1){
//            NSLog(@"advisor1 == true");
//        }else{
//            NSLog(@"advisor1 == false");
//        }
        
        //Create Note Object
        Note* myNoteObj =[[Note alloc]initWithNote:myNote moodValue:[myMood intValue] date:myDate advisor1:myAdvisor1 andAdvisor2:myAdvisor2];
        
        [holderArray addObject:myNoteObj];
        currentIndex = nil;  // this should remove it from memory
    }
    
    
    myArray = holderArray;
    return myArray;
}





//add note    //just prints in fake db because _TDataBases is not part of the class so is recreated with each init  (I tried it was difficult)
- (void)addNote:(Note *)noteToInsert{
    NSLog(@"Note added to db");
    NSLog(@"Note : %@", [noteToInsert getNote]);
    NSLog(@"moodVal: %i",[noteToInsert getMood]);
    NSLog(@"date: %@",[noteToInsert getDateAsNSString]);
    NSLog(@"advisor1: %@",[noteToInsert getAdvisor1] ? @"True" : @"False");  //shorthand if:else
    NSLog(@"advisor2: %@",[noteToInsert getAdvisor2] ? @"True" : @"False");
    
    // get what my next id should be
    //NSNumber* myIdNum = [[NSNumber alloc]initWithInt:(int)[_TDatabase count] + 1];
}



@end



