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
#import "GGTabBarAppearanceKeys.h"

@interface NNHomeTabController ()

@end

@implementation NNHomeTabController

- (instancetype)init {
    self = [super init];
    
    if(self) {
        NNHomeViewController *homevc = [NNHomeViewController new];
        NNCategoryViewController *categoryvc = [NNCategoryViewController new];
        
        self.viewControllers = @[homevc, categoryvc];
        
        self.tabBarAppearanceSettings = @{kTabBarAppearanceBackgroundColor : [UIColor lightGrayColor]};
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
