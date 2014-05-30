//
//  ReimburseTableView.m
//  ReimburseAssist
//
//  Created by hxx on 5/30/14.
//  Copyright (c) 2014 hxx. All rights reserved.
//

#import "ReimburseTableView.h"
#import "ReimburseTableViewController.h"
@implementation ReimburseTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@",NSStringFromCGPoint([gestureRecognizer locationInView:self]));
    BOOL value = [super gestureRecognizerShouldBegin:gestureRecognizer];
    ReimburseTableViewController * delegate = (ReimburseTableViewController *)self.actionDelegate;
    if ([delegate respondsToSelector:@selector(gestureRecognizerShouldBegin:)])
        [delegate performSelector:@selector(gestureRecognizerShouldBegin:) withObject:gestureRecognizer];
    return value;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch!");
}

@end
