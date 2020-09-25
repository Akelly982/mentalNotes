//
//  myColors.m
//  mentalNotes
//
//  Created by Aidan Kelly on 25/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import "myColors.h"

@implementation myColors

- (instancetype)init
{
    self = [super init];
    if (self) {
        //set up colors
        // init with RGB (they are of type CGFLOAT...)
        _myRed = [[UIColor alloc]initWithRed:255 green:0 blue:0 alpha:1];
        _myGreen = [[UIColor alloc]initWithRed:0 green:255 blue:0 alpha:1];
        _myBlue = [[UIColor alloc]initWithRed:0 green:0 blue:255 alpha:1];
    }
    return self;
}



@end
