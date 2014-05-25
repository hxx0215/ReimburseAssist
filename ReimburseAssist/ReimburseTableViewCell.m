//
//  ReimburseTableViewCell.m
//  ReimburseAssist
//
//  Created by hxx on 14-5-25.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "ReimburseTableViewCell.h"

@implementation ReimburseTableViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = NO;
        self.layer.borderColor = [[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0] CGColor];
        self.layer.borderWidth = 0.7f;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
}


@end
