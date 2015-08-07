//
//  NNProductListViewController.m
//  cmall
//
//  Created by ddpisces on 15/8/6.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import "NNProductListViewController.h"
#import "NNUtility.h"
#import "AppDelegate.h"

@interface NNProductListViewController ()

@end

@implementation NNProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = NNApplicationSize;
    
    NSInteger height = self.navigationBar.frame.size.height;
    NSInteger width  = self.navigationBar.frame.size.width;

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, height, width, size.height - height)];

    [btn setTitle:@"this is a button" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onButton:(id)sender {
    DDLogVerbose(@"Button in Product");
    
    NNProductListViewController *productList = [NNProductListViewController new];
    [AppDelegateM.navigationController pushViewController:productList animated:YES];
}

@end
