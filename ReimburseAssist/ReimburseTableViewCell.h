//
//  ReimburseTableViewCell.h
//  ReimburseAssist
//
//  Created by hxx on 14-5-25.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "GMGridViewCell.h"

@protocol ReimburseTableViewCellDelegate;

@interface ReimburseTableViewCell : GMGridViewCell <UITextFieldDelegate>
@property (nonatomic, retain) NSMutableDictionary *style;
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, assign)id<ReimburseTableViewCellDelegate> delegate;
- (void)beginEditAtIndex:(NSInteger)index;
- (void)endEdit;
@end


@protocol ReimburseTableViewCellDelegate <NSObject>

@optional
- (void)cellTextFieldWillReturn:(ReimburseTableViewCell *)cell textField:(UITextField *)textField;

@end