//
//  DbManager.h
//  mentalNotes
//
//  Created by Aidan Kelly on 18/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "TempDb.h"

NS_ASSUME_NONNULL_BEGIN

@interface DbManager : NSObject
// this class should have consistent callable methods to getting data from the db



- (NSArray*) getNotes;

- (NSArray*) getNotesRecent : (int) numItems;


@end

NS_ASSUME_NONNULL_END
