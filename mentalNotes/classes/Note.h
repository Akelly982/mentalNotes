//
//  Note.h
//  mentalNotes
//
//  Created by Aidan Kelly on 13/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Note : NSObject

@property (readonly) int myId;
@property (readonly) NSString* note;
@property (readonly) int mood;
@property (readonly) NSDate* date;
@property (readonly) bool advisor1;
@property (readonly) bool advisor2;



- (instancetype)initWithNote: (NSString*) myNote   moodValue : (int) myMoodVal   date : (NSDate*) myDate  advisor1 : (bool) myAdvisor1   Advisor2 : (bool) myAdvisor2   andId : (int) myId;
- (instancetype)initNoteForDb: (NSString*) myNote   moodValue : (int) myMoodVal   date : (NSDate*) myDate  advisor1 : (bool) myAdvisor1   Advisor2 : (bool) myAdvisor2;

//getters and setters
-(int) getId;
-(void) setId: (int)myId;

-(NSString*)getNote;
-(void) setNote: (NSString*)note;

-(int)getMood;
-(void) setMood: (int)mood;

-(NSDate*)getDate;
-(NSString*)getDateAsNSString;
-(void) setDate: (NSDate*)date;

-(bool)getAdvisor1;
-(int)getAdvisor1IntValue;
-(void)setAdvisor1:(bool)boolVal;

-(bool)getAdvisor2;
-(int)getAdvisor2IntValue;
-(void)setAdvisor2:(bool)boolVal;



@end

NS_ASSUME_NONNULL_END
