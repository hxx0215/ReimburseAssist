//
//  SFHomeViewController.m
//  ReimburseAssist
//
//  Created by hxx on 14-4-24.
//  Copyright (c) 2014年 hxx. All rights reserved.
//

#import "SFHomeViewController.h"
#import "SFReimburseAssistCore.h"
@interface SFHomeViewController ()

@end

@implementation SFHomeViewController

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
    SFReimburseAssistCore *core = [[SFReimburseAssistCore alloc] init];
    core.coefficient = [[NSMutableArray alloc] init];
    for (int i=9;i>0;i--)
        [core.coefficient addObject:[NSNumber numberWithInt:i*9]];
    [core sort];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
