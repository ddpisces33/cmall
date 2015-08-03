//
//  NNHomeTabController.m
//  cmall
//
//  Created by ddpisces on 15/7/31.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import "NNHomeTabController.h"
#import "NNHomeViewController.h"
#import "NNCategoryViewController.h"
#import "NNBaseNavigationController.h"

@interface NNHomeTabController ()

@end

@implementation NNHomeTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NNHomeViewController *homevc = [[NNHomeViewController alloc] init];
    NNCategoryViewController *categoryvc = [[NNCategoryViewController alloc] init];
    
    self.viewControllers = @[homevc, categoryvc];
    self.tabBar.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
