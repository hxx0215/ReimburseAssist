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
#import "Constants.h"

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
        _items = [[NSMutableArray alloc]initWithObjects:@"名称",@"单价", nil];
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
	return 4 + [_items count] ;//+ 100;
}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation {
	return CGSizeMake(160, 44);
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index {
	CGSize size = [self GMGridView:gridView sizeForItemsInInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    NSMutableDictionary *cellStyle = [[NSMutableDictionary alloc] init];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
//    view.backgroundColor = [UIColor clearColor];
//    view.layer.masksToBounds = NO;
//    view.layer.borderColor = [[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0] CGColor];
//    view.layer.borderWidth = 0.7f;

    ReimburseTableViewCell *cell = (ReimburseTableViewCell *)[gridView dequeueReusableCell];
    if (!cell){
        cell = [[[ReimburseTableViewCell alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)] autorelease];
    }
    [cellStyle setObject:[UIColor blackColor] forKey:kLabelColor];
    if (index < [_items count])
    {
        [cellStyle setObject:[_items objectAtIndex:index] forKey:kLabelText];
        
    }
    else if (index < [_items count] + 2)
    {
        [cellStyle setObject:[NSNumber numberWithBool:YES] forKey:kButtonShow];
    }
    else if (index < [_items count] + 3)
    {
        [cellStyle setObject:@"总金额" forKey:kLabelText];
        [cellStyle setObject:[UIColor blueColor] forKey:kLabelColor];
    }
    else {
        [cellStyle setObject:[NSNumber numberWithBool:YES] forKey:kButtonShow];
    }
    cell.style = cellStyle;
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
