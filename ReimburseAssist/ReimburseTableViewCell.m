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
    UITextField *_textField;
    NSInteger _index;
}

@synthesize style = _style;
@synthesize label = _label;
@synthesize delegate = _delegate;

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
        [self initTextField];
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
//    _addBtn = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
//    _addBtn.frame = self.bounds;
//    [_addBtn setTitle:@"点击添加" forState:UIControlStateNormal];
//    [_addBtn setTitleColor:[UIColor colorWithWhite:0.7 alpha:0.7] forState:UIControlStateNormal];
//    [_addBtn addTarget:self action:@selector(addContent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
    _addBtn.center = self.center;
}

- (void)initTextField{
    _textField = [[UITextField alloc]initWithFrame:self.bounds];
    _textField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.9];
    _textField.textAlignment = NSTextAlignmentRight;
    _textField.delegate = self;
    [self addSubview:_textField];
    _textField.hidden = YES;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
- (void)addContent:(id)sender{
    NSLog(@"addcontent");
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
- (void)beginEditAtIndex:(NSInteger)index
{
    _textField.hidden = NO;
    _label.hidden = YES;
    _addBtn.hidden = YES;
    _textField.text = _label.text;
    _index = index;
    [_textField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    _textField.hidden = YES;
    _label.hidden = NO;
    [_delegate cellTextFieldWillReturn:self textField:_textField];
    return YES;
}
- (void)endEdit{
    _textField.hidden = YES;
    _textField.text = @"";
    _label.hidden = NO;
    if (!_label.text || [_label.text isEqualToString:@""])
        _addBtn.hidden = NO;
    [_textField resignFirstResponder];
}
@end
