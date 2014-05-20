//
//  SFReimburseAssistCore.m
//  ReimburseAssist
//
//  Created by hxx on 14-4-28.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "SFReimburseAssistCore.h"

@implementation SFReimburseAssistCore {
	int _iTotal;
	int _step;
    BOOL _ansFlag;
}
@synthesize coefficient = _coefficient;
@synthesize total = _total;
@synthesize x = _x;

- (id)init {
	if (self = [super init]) {
        _ansFlag = NO;
	}
	return self;
}

- (void)format {
	for (int i = 0; i < [_coefficient count]; i++) {
		double t = [_coefficient[i] doubleValue];
		t *= 100;
		int j = (int)t;
		[_coefficient replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:j]];
	}
	_total *= 100;
	_iTotal = (int)_total;
	_step = [self gcds:_coefficient];
	[self sort];
}

- (void)sort {
	_coefficient = [[_coefficient sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
	//NSLog(@"%d",[self gcds:_coefficient]);
}

- (int)gcd:(int)a b:(int)b {
	if (b == 0) {
		return a;
	}
	return [self gcd:b b:a % b];
}

- (int)gcds:(NSMutableArray *)arr {
	if (1 == [arr count]) return [arr[0] intValue];
	int a = [arr[0] intValue];
	for (int i = 1; i < [arr count]; i++) {
		int b = [arr[i] intValue];
		a = [self gcd:a b:b];
	}
	return a;
}

- (BOOL)hasAnswer {
	if (_iTotal % _step == 0) return YES;
	return NO;
}

- (void)calc:(int) n {
    for(int i=0;i<= _iTotal/[_coefficient[n] intValue];i++)
    {
        if ([_x count] < n)
            [_x addObject:[NSNumber numberWithInt:i]];
        else
            [_x replaceObjectAtIndex:n withObject:[NSNumber numberWithInt:i]];
        _iTotal -= n*i;
        if (_iTotal == 0) {
            _ansFlag = YES;
            return ;
        }
        [self calc:n+1];
        if (_ansFlag) return ;
        _iTotal += n*i;
    }
}
@end
