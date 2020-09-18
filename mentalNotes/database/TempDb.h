//
//  TempDb.h
//  mentalNotes
//
//  Created by Aidan Kelly on 18/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

NS_ASSUME_NONNULL_BEGIN

@interface TempDb : NSObject

@property NSDictionary* TDatabase;

- (NSArray*) getNotes;

- (NSArray*) getNotesRecent : (int) numNotes;




@end

NS_ASSUME_NONNULL_END
