//
//  NNHomeViewController.m
//  cmall
//
//  Created by ddpisces on 15/7/31.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import "NNHomeViewController.h"

@interface NNHomeViewController ()

@end

@implementation NNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"icon_02"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *image2 = [UIImage imageNamed:@"icon_02C"];
    image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *barItem = [[UITabBarItem alloc] initWithTitle:@"" image:image selectedImage:image2];
    barItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    self.tabBarItem = barItem;
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
