//
//  InfoCell.h
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

#ifndef InfoCell_h
#define InfoCell_h

#import <UIKit/UIKit.h>

@interface InfoTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end

#endif /* InfoCell_h */
