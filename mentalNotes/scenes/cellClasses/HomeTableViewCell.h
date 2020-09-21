//
//  homeTableViewCell.h
//  mentalNotes
//
//  Created by 7884 on 21/9/20.
//  Copyright © 2020 Aidan Kelly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;



@end

NS_ASSUME_NONNULL_END
