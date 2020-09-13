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



//getters and setters 
-(NSString*)getNote;
-(void) setNote: (NSString*)note;

-(int)getMood;
-(void) setMood: (int)mood;

-(NSDate*)getDate;
-(void) setDate: (NSDate*)date;


@end

NS_ASSUME_NONNULL_END
