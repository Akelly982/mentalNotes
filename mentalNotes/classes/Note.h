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

//later on we will declarate this
@property (readonly) NSString* note;
@property (readonly) int mood;
@property (readonly) NSDate* date;
@property (readonly) bool advisor1;
@property (readonly) bool advisor2;



- (instancetype)initWithNote: (NSString*) myNote   moodValue : (int) myMoodVal   date : (NSDate*) myDate  advisor1 : (bool) myAdvisor1   andAdvisor2 : (bool) myAdvisor2 ;


//getters and setters 
-(NSString*)getNote;
-(void) setNote: (NSString*)note;

-(int)getMood;
-(void) setMood: (int)mood;

-(NSDate*)getDate;
-(NSString*)getDateAsNSString;
-(void) setDate: (NSDate*)date;

-(bool)getAdvisor1;
-(void)setAdvisor1:(bool)boolVal;

-(bool)getAdvisor2;
-(void)setAdvisor2:(bool)boolVal;



@end

NS_ASSUME_NONNULL_END
