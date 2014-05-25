//
//  SFHomeViewController.m
//  ReimburseAssist
//
//  Created by hxx on 14-4-24.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "SFHomeViewController.h"
#import "SFReimburseAssistCore.h"
#import "ReimburseTableViewController.h"
@interface SFHomeViewController (){
    NSMutableArray *_coefficient;
    ReimburseTableViewController *_reimbursetVCtrl;
}

@end

@implementation SFHomeViewController
@synthesize tableView = _tableView;
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"报账小助手";
    self.view.backgroundColor = [UIColor clearColor];
    SFReimburseAssistCore *core = [[SFReimburseAssistCore alloc] init];
    core.coefficient = [[NSMutableArray alloc] init];
    for (int i=9;i>0;i--)
        [core.coefficient addObject:[NSNumber numberWithInt:i*9]];
    [core sort];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                               target:self
                               action:@selector(addReimburseItem:)];
    self.navigationItem.rightBarButtonItem = addBtn;
    [addBtn release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addReimburseItem:(id)sender
{
    ReimburseTableViewController *reimbursetVCtrl = [[ReimburseTableViewController alloc] init];
    reimbursetVCtrl.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:reimbursetVCtrl animated:YES];
    [reimbursetVCtrl release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *tCellWithIdentifier = @"Cell";
	UITableViewCell *tCell = [tableView dequeueReusableCellWithIdentifier:tCellWithIdentifier];
	if (!tCell) {
		tCell = [[[UITableViewCell alloc]
		          initWithStyle:UITableViewCellStyleSubtitle
                  reuseIdentifier:tCellWithIdentifier]
		         autorelease];
	}
    return tCell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
