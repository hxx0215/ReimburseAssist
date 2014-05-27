//
//  GridCellEditView.m
//  ReimburseAssist
//
//  Created by hxx on 14-5-26.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "GridCellEditView.h"
#import <QuartzCore/QuartzCore.h>
@implementation GridCellEditView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 0.7;
        self.layer.masksToBounds = YES;
        // maskstobounds为yes时 shadow无效。。这里还要参照下stackoverflow的解决方案
        /*
        self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 3.0f;
        self.layer.shadowOpacity = 0.8f;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.layer.bounds].CGPath;*/
        
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

- (void)dealloc
{
    [super dealloc];
}

@end
