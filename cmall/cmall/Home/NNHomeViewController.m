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

- (instancetype)init {
    self = [super init];
    
    if(self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil
                                                        image:[UIImage imageNamed:@"user_normal"]
                                                selectedImage:[UIImage imageNamed:@"user_pressed"]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
