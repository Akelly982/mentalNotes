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
        
        
        _TDatabase = @{
            @0 : @{@"Note" : @"started project XYZ", @"moodVal": @8 , @"date" : @"08,02,2020"},
            @1 : @{@"Note" : @"Created a box", @"moodVal": @2 , @"date" : @"02,02,2020"},
            @2 : @{@"Note" : @"The tree of life", @"moodVal": @3 , @"date" : @"21,02,2020"},
            @3 : @{@"Note" : @"Tigers are dangerous", @"moodVal": @6 , @"date" : @"22,02,2020"},
            @4 : @{@"Note" : @"Iron man uses AI JARVIS", @"moodVal": @10 , @"date" : @"23,02,2020"},
            @5 : @{@"Note" : @"Monkeys can climb like a boss", @"moodVal": @15 , @"date" : @"13,02,2020"},
            @6 : @{@"Note" : @"Time is the only true mesurment of existance", @"moodVal": @-2 , @"date" : @"14,02,2020"},
            @7 : @{@"Note" : @"sleeping is for the dead", @"moodVal": @2 , @"date" : @"15,02,2020"},
            @8 : @{@"Note" : @"All coding languages are quite similar with they just have different syntax", @"moodVal": @8 , @"date" : @"02,02,2020"},
            @9 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"01,02,2020"},
            @10 : @{@"Note" : @"this is my note", @"moodVal": @11 , @"date" : @"02,02,2020"},
            @11 : @{@"Note" : @"this is my note", @"moodVal": @5 , @"date" : @"29,02,2020"},
            @12 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"32,02,2020"},
            @13 : @{@"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"21,02,2020"},
            @14 : @{@"Note" : @"this is my note", @"moodVal": @6 , @"date" : @"31,02,2020"},
            @15 : @{@"Note" : @"this is my note", @"moodVal": @3 , @"date" : @"15,02,2020"},
            @16 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"16,02,2020"},
            @17 : @{@"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"10,02,2020"},
            @18 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"30,02,2020"},
            @19 : @{@"Note" : @"this is my note", @"moodVal": @2 , @"date" : @"22,02,2020"},
            @20 : @{@"Note" : @"this is my note", @"moodVal": @3 , @"date" : @"11,02,2020"},
            @21 : @{@"Note" : @"this is my note", @"moodVal": @5 , @"date" : @"12,02,2020"},
            @22 : @{@"Note" : @"this is my note", @"moodVal": @6 , @"date" : @"13,02,2020"},
            @23 : @{@"Note" : @"this is my note", @"moodVal": @7 , @"date" : @"14,03,2020"},
            @24 : @{@"Note" : @"this is my note", @"moodVal": @9 , @"date" : @"20,04,2020"},
            @25 : @{@"Note" : @"this is my note", @"moodVal": @10 , @"date" : @"20,05,2019"}
        };
        
        
        
    }
    return self;
}



- (NSArray*) getNotes{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    for (int i = 0; i<= [_TDatabase count]; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
        NSNumber* myMood = [self TDatabase][currentIndex][@"Note"];
        NSDate* myDate =  [self TDatabase][currentIndex][@"Note"];
        
        Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
        
        [holderArray addObject:myNoteObj];
        currentIndex = nil;  // this should remove it from memory
    }
    myArray = holderArray;
    return myArray;
}




- (NSArray*) getNotesRecent : (int) numNotes{
    NSArray* myArray = [[NSArray alloc]init];
    NSMutableArray* holderArray = [[NSMutableArray alloc]init]; //gonna hold an array of objects of type notes //used mutable so i can add to it
    
    
    //check to ensure numNotes is not larger than dataBase set
    if (numNotes > [_TDatabase count]){
        numNotes = (int)[_TDatabase count];   //cast as int
    }
    
    // use num notes to determine how many we get
    for (int i = 0; i<= numNotes; i++ ){
        NSNumber* currentIndex = [[NSNumber alloc]initWithInt:i];    //NSnumber however is immutible
        NSString* myNote = [self TDatabase][currentIndex][@"Note"];    //need to use NSNumber to get around using @0
        NSNumber* myMood = [self TDatabase][currentIndex][@"Note"];
        NSDate* myDate =  [self TDatabase][currentIndex][@"Note"];
        
        Note* myNoteObj = [[Note alloc]initWithNote:myNote moodValue:[myMood intValue] andDate:myDate];
        
        [holderArray addObject:myNoteObj];
        currentIndex = nil;  // this should remove it from memory
    }
    
    
    myArray = holderArray;
    return myArray;
}





@end



