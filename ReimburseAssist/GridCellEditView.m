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
{
    UIButton *_resetBtn;
    UIButton *_cancelBtn;
    UITextField *_textField;
}

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
        
        _resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width/2, 50);
        _resetBtn.frame = frame;
        [_resetBtn setTitle:@"清空" forState:UIControlStateNormal];
        [_resetBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _resetBtn.layer.borderColor = [[UIColor blackColor] CGColor];
        _resetBtn.layer.borderWidth = 0.7f;
        [_resetBtn addTarget:self
                      action:@selector(resetTextField:)
            forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_resetBtn];
        
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        frame.origin.x = frame.size.width;
        _cancelBtn.frame = frame;
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _cancelBtn.layer.borderColor = [[UIColor blackColor] CGColor];
        _cancelBtn.layer.borderWidth = 0.7f;
        [self addSubview:_cancelBtn];
        
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        CGFloat tPosX = self.bounds.size.width / 2;
        CGFloat tPosY = (self.bounds.size.height - frame.size.height) / 2;
        _textField.center = CGPointMake(tPosX, tPosY);
        _textField.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1.0];
        _textField.layer.masksToBounds = YES;
        _textField.textAlignment = NSTextAlignmentRight;
        [self addSubview:_textField];
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

- (void)resetTextField:(id)sender
{
    
}


@end
