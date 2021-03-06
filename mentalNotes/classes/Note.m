//
//  Note.m
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "Note.h"

@implementation Note

- (instancetype)init
{
    self = [super init];
    if (self) {
        //initialise the date,mood,note
        _date = [NSDate date];
        _mood = 5;
        _note = @"init string";
    }
    return self;
}

- (instancetype)initWithNote: (NSString*) myNote   moodValue : (int) myMoodVal   date : (NSDate*) myDate  advisor1 : (bool) myAdvisor1   Advisor2 : (bool) myAdvisor2   andId : (int) myId{
    self = [super init];
       if (self) {
           _note = myNote;
           _mood = myMoodVal;
           _date = myDate;
           _advisor1 = myAdvisor1;
           _advisor2 = myAdvisor2;
           _myId = myId;
       }
    return self;
}


- (instancetype)initNoteForDb: (NSString*) myNote   moodValue : (int) myMoodVal   date : (NSDate*) myDate  advisor1 : (bool) myAdvisor1   Advisor2 : (bool) myAdvisor2{
    self = [super init];
       if (self) {
           _note = myNote;
           _mood = myMoodVal;
           _date = myDate;
           _advisor1 = myAdvisor1;
           _advisor2 = myAdvisor2;
       }
    return self;
}



// getters and setters for private variables

- (int)getId{
    return _myId;
}

- (void)setId:(int)myId{
    _myId = myId;
}



- (NSString*) getNote{
    return _note;
}

- (void) setNote: (NSString*) note{
    _note = note;
}


- (int)getMood{
    return _mood;
}
- (void) setMood: (int)mood{
    // make sure mood is within range
    if (mood > 10){
        mood = 10;
    }else if (mood < 0){
        mood = 0;
    }
    //set mood
    _mood = mood;
    
}




- (NSDate*)getDate{
    return _date;
}
- (void) setDate: (NSDate*)date{
    date = _date;
}

- (NSString *)getDateAsNSString{
    NSString* holder = [[NSString alloc]init];
    
    // use formatter to convert date
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    // user formatter to set to date
    holder = [formatter stringFromDate:_date];
    
    return holder;
}



-(bool)getAdvisor1{
    return _advisor1;
}

- (int)getAdvisor1IntValue{
    // 0 == false
    // 1 == true
    if (_advisor1){
        return 1;
    }else{
        return 0;
    }
}

-(void)setAdvisor1:(bool)boolVal{
    _advisor1 = boolVal;
}

-(bool)getAdvisor2{
    return _advisor2;
}

- (int)getAdvisor2IntValue{
    // 0 == false
    // 1 == true
    if (_advisor2){
        return 1;
    }else{
        return 0;
    }
}

-(void)setAdvisor2:(bool)boolVal{
    _advisor2 = boolVal;
}




@end



    

