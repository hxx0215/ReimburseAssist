//
//  ReimburseTableViewCell.m
//  ReimburseAssist
//
//  Created by hxx on 14-5-25.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "ReimburseTableViewCell.h"
#import "Constants.h"

@implementation ReimburseTableViewCell{
    UILabel *_addBtn;
}

@synthesize style = _style;
@synthesize label = _label;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = NO;
        self.layer.borderColor = [[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0] CGColor];
        self.layer.borderWidth = 0.7f;

        [self initLabel];
        [self initButton];
        
    }
    return self;
}

- (void)dealloc
{
    [_style release];
    [_label release];
    [_addBtn release];
    
    [super dealloc];
}

- (void)initLabel{
    _label = [[UILabel alloc] initWithFrame:self.bounds];
    _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor blackColor];
    _label.highlightedTextColor = [UIColor whiteColor];
    [self addSubview:_label];
}
- (void)initButton{
//    CGSize imgSize = CGSizeMake(25, 25);
    _addBtn = [[UILabel alloc]initWithFrame:self.bounds];
    _addBtn.text = @"点击添加";
    _addBtn.textAlignment = NSTextAlignmentCenter;
    _addBtn.textColor = [UIColor colorWithRed:0.7 green:.7 blue:0.7 alpha:.7];
//    _addBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, imgSize.width, imgSize.height)];
//    [_addBtn setBackgroundImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    [self addSubview:_addBtn];
    _addBtn.center = self.center;
}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

- (void)setStyle:(NSMutableDictionary *)style
{
    _label.text = [style objectForKey:kLabelText];
    _label.textColor = [style objectForKey:kLabelColor];
    _addBtn.hidden = ![style objectForKey:kButtonShow];
    [self setNeedsDisplay];
}

- (UIImage *)imageScale:(UIImage *)img toSize:(CGSize)newsize {
	UIGraphicsBeginImageContext(newsize);
	[img drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
	UIImage *scaleimg = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return scaleimg;
}
@end
