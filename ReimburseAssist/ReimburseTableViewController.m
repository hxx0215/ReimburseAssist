//
//  ReimburseTableViewController.m
//  ReimburseAssist
//
//  Created by hxx on 14-5-21.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "ReimburseTableViewController.h"
#import "ReimburseTableView.h"
#import "ReimburseTableViewCell.h"
#import "Constants.h"
#import "GridCellEditView.h"

@interface ReimburseTableViewController () <GMGridViewDataSource, GMGridViewActionDelegate, UIGestureRecognizerDelegate,ReimburseTableViewCellDelegate> {
	__gm_weak ReimburseTableView *_gridView;
    NSMutableArray *_items;
    GridCellEditView *_editView;
    ReimburseTableViewCell *cellInEditing;
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
    _gridView = [[ReimburseTableView alloc] initWithFrame:self.view.bounds];
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
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
//    _gridView.mainSuperView = self.view;
    [_gridView reloadData];

    _editView = [[GridCellEditView alloc]initWithFrame:CGRectMake(10, 100 , 300, 180)];
    _editView.userInteractionEnabled =YES;
    
    self.view.clipsToBounds = YES;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view addSubview:_gridView];
    [_gridView reloadData];
    [self.view addSubview:_editView];
    _editView.hidden = YES;
    CGFloat navHeight = self.navigationController.navigationBar.bounds.size.height;
    CGRect editViewFrame = CGRectMake(10, 100 + navHeight, 300, 180);
    _editView.frame = editViewFrame;
}

- (void)dealloc
{
    [_gridView release];
    [_items release];
    [_editView release];
    [super dealloc];
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
        cell.delegate = self;
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
    [cellStyle release];
    return cell;
}

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position {
    NSLog(@"tap:%ld",(long)position);
    //大小要重新调试
//    _editView.hidden = !_editView.hidden;
    [cellInEditing endEdit];
    if (position < 2) return;
    if (position == [_items count] +2) return ;
    ReimburseTableViewCell *cell =(ReimburseTableViewCell *) [_gridView cellForItemAtIndex:position];
    cellInEditing = cell;
    [cell beginEditAtIndex:position];
}

- (void)GMGridViewDidTapOnEmptySpace:(GMGridView *)gridView
{
//    _editView.hidden = !_editView.hidden;
    [cellInEditing endEdit];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@",NSStringFromCGPoint([gestureRecognizer locationInView:self.view]));
    BOOL isTouchInEditView = [_editView gestureRecognizerShouldBegin:gestureRecognizer];
    if (isTouchInEditView) NSLog(@"touchineditview");
    else NSLog(@"noinview");
    return YES;
}

- (void)cellTextFieldWillReturn:(ReimburseTableViewCell *)cell textField:(UITextField *)textField
{
    NSInteger index = [_gridView positionForItemSubview:cell];
    if ([_items count] <= index ){
        if (index % 2 ==0)
        {
            [_items addObject:textField.text];
            [_items addObject:@"0.00"];
        }
        else {
            [_items addObject:[self randName]];
            [_items addObject:textField.text];
        }
    }
    else{
        [_items replaceObjectAtIndex:index withObject:textField.text];
    }
        
    [_gridView reloadData];
}
- (NSString *)randName
{
    int r = rand();
    NSString *name = [NSString stringWithFormat:@"rand%d",r];
    return name;
}
@end
