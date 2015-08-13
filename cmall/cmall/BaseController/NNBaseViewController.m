//
//  NNBaseViewController.m
//  cmall
//
//  Created by ddpisces on 15/7/31.
//  Copyright (c) 2015年 Picnic. All rights reserved.
//

#import "NNBaseViewController.h"
#import "Masonry.h"

@interface NNBaseViewController () {
    UIImageView *imageV;
    UIView *viewBar;
}

@end

@implementation NNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigationBar];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar {
    
    self.navigationController.navigationBarHidden = YES;
    
    viewBar = [[UIView alloc] init];
    imageV  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top"]];
    
    [viewBar addSubview:imageV];
    [self.view addSubview:viewBar];
    
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(viewBar);
    }];
    
    [viewBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@60);
    }];
}

- (void)setTitle:(NSString *)title {
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = 1;
    [imageV addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(imageV);
    }];
}

- (UIView *)navigationBar {
    return viewBar;
}

@end
