//
//  DbManager.m
//  mentalNotes
//
//  Created by Aidan Kelly on 18/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "DbManager.h"

@implementation DbManager



- (NSArray *)getNotes{
    NSArray* myArray = [[NSArray alloc]init];
    
    // get from temp DB
    TempDb* myDb = [[TempDb alloc]init];
    myArray = [myDb getNotes];
    
    
    return myArray;
}



- (NSArray*) getNotesRecent : (int) numItems{
    NSArray* myArray = [[NSArray alloc]init];
    
    
    TempDb* myDb = [[TempDb alloc]init];
    myArray = [myDb getNotesRecent:numItems];
    
    
    return myArray;
}
@end
