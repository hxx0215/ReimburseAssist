//
//  ReimburseTableViewController.m
//  ReimburseAssist
//
//  Created by hxx on 14-5-21.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "ReimburseTableViewController.h"
#import "GMGridView.h"
#import "ReimburseTableViewCell.h"

@interface ReimburseTableViewController () <GMGridViewDataSource, GMGridViewActionDelegate> {
	__gm_weak GMGridView *_gridView;
    NSMutableArray *_items;
}

@end

@implementation ReimburseTableViewController

- (id)init{
	self = [super init];
	if (self) {
		// Custom initialization
        _items = [[NSMutableArray alloc]init];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
    _gridView = [[GMGridView alloc] initWithFrame:self.view.bounds];
    //gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _gridView.backgroundColor = [UIColor clearColor];
    //[self.view addSubview:gmGridView];
    //_gridView = gmGridView;
    
    _gridView.style = GMGridViewStyleSwap;
    _gridView.itemSpacing = 0;
    _gridView.minEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    _gridView.centerGrid = NO;
    _gridView.actionDelegate = self;
    //_gridView.sortingDelegate = self;
    //_gridView.transformDelegate = self;
    _gridView.dataSource = self;
    [_gridView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addSubview:_gridView];
    [_gridView reloadData];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView {
	return 6 + [_items count] / 2;
}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation {
	return CGSizeMake(160, 44);
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index {
	CGSize size = [self GMGridView:gridView sizeForItemsInInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    view.backgroundColor = [UIColor clearColor];
    view.layer.masksToBounds = NO;
    view.layer.borderColor = [[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0] CGColor];
    view.layer.borderWidth = 0.7f;

    ReimburseTableViewCell *cell = (ReimburseTableViewCell *)[gridView dequeueReusableCell];
    if (!cell){
        cell = [[[ReimburseTableViewCell alloc] initWithFrame:view.bounds] autorelease];
        cell.contentView = view;
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    if (index < 2) {
        UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        if (index == 0)
            label.text = @"名称";
        else
            label.text = @"单价";
        label.textAlignment = NSTextAlignmentRight;
        //label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.highlightedTextColor = [UIColor whiteColor];
        [view addSubview:label];
        cell.contentView = view;
    }
    else if (index < 2 + [_items count]){
        cell.contentView = view;
    }
    else if (index < 2 + [_items count] + 2){
        CGSize imgSize = CGSizeMake(20, 20);
        UIImage *addImage = [self imageScale:[UIImage imageNamed:@"add.png"] toSize:imgSize];
        //UIImage *deleteImage = [self imageScale:[UIImage imageNamed:@"delete.png"] toSize:imgSize];
        UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, imgSize.width, imgSize.height)];
        [addBtn setBackgroundImage:addImage forState:UIControlStateNormal];
        [view addSubview:addBtn];
        cell.contentView = view;
    }
    else {
        UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        label.text = @"总金额";
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor blueColor];
        label.highlightedTextColor = [UIColor whiteColor];
        [view addSubview:label];
        cell.contentView = view;
    }
    [view release];
    return cell;
}

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position {
    NSLog(@"tap:%d",position);
}

- (UIImage *)imageScale:(UIImage *)img toSize:(CGSize)newsize {
	UIGraphicsBeginImageContext(newsize);
	[img drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
	UIImage *scaleimg = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return scaleimg;
}
@end
