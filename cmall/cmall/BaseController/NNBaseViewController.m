//
//  NNBaseViewController.m
//  cmall
//
//  Created by ddpisces on 15/7/31.
//  Copyright (c) 2015年 Picnic. All rights reserved.
//

#import "NNBaseViewController.h"

@interface NNBaseViewController () {
    UIImageView *imageV;
}

@end

@implementation NNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar {
    
    self.navigationController.navigationBarHidden = YES;
    
    UIView *viewBar = [[UIView alloc] init];
    imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"top"]];
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue] > 6.1)
    {
        viewBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 40+20);
        
    }else{
        viewBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    }
    
    imageV.frame = viewBar.frame;
    [viewBar addSubview:imageV];
    [self.view addSubview:viewBar];
}

- (void)setTitle:(NSString *)title {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, imageV.frame.size.height - 44, imageV.frame.size.width - 130, 44)];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = 1;
    [imageV addSubview:titleLabel];
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
