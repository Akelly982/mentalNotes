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




// getters and setters for private variables
- (NSString*)getNote{
    return [self note];
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

@end



    

