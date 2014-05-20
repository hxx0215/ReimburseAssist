//
//  SFReimburseAssistCore.h
//  ReimburseAssist
//
//  Created by hxx on 14-4-28.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFReimburseAssistCore : NSObject
@property (nonatomic,retain) NSMutableArray *coefficient;
@property (nonatomic,assign) double total;
@property (nonatomic,assign) NSMutableArray *x;
- (void)sort;
@end
