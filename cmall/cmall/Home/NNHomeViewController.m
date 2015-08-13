//
//  NNHomeViewController.m
//  cmall
//
//  Created by ddpisces on 15/7/31.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "NNHomeViewController.h"
#import "UIButton+WebCache.h"
#import "NNUtility.h"
#import "NNProductListViewController.h"
#import "AppDelegate.h"
#import "NNCategoryViewController.h"
#import "Masonry.h"

@interface NNHomeViewController () {
    UIScrollView *scrollView;
}

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
    
    [self setTitle:@"首页"];
    
    scrollView = [UIScrollView new];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationBar.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(self.view.mas_width);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    // TODO: dummy data
    NSString *dummyImage = @"http://a2.att.hudong.com/65/47/01300000145751121643476275305.jpg";
    NSString *dummyImage2 = @"http://img103.mypsd.com.cn/20130506/1/Mypsd_6736_201305060815050142B.jpg";
    
    NSArray *array = @[@{@"image":dummyImage, @"link":@"link"}, @{@"image":dummyImage2, @"link":@"link"},];
    
    NNScrollerView *scroller = [[NNScrollerView alloc] initWithFrameRect:CGRectMake(0, 0, self.view.frame.size.width, 160)
                                                              scrolArray:[NSArray arrayWithArray:array] needTitile:YES];
    scroller.delegate = self;
    scroller.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:scroller];
    
    // New Products
    UIButton *buttonLeft = [UIButton new];
    [buttonLeft sd_setImageWithURL:[NSURL URLWithString:dummyImage] forState:UIControlStateNormal];
    buttonLeft.tag = 1;
    [scrollView addSubview:buttonLeft];
    
    UIButton *buttonCenter = [UIButton new];
    [buttonCenter sd_setImageWithURL:[NSURL URLWithString:dummyImage] forState:UIControlStateNormal];
    buttonCenter.tag = 2;
    [scrollView addSubview:buttonCenter];
    
    UIButton *buttonRight = [UIButton new];
    [buttonRight sd_setImageWithURL:[NSURL URLWithString:dummyImage] forState:UIControlStateNormal];
    buttonRight.tag = 3;
    [scrollView addSubview:buttonRight];
    
    [buttonLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scroller.mas_bottom).offset(5);
        make.left.equalTo(self.view).offset(5);
        make.right.equalTo(buttonCenter.mas_left).offset(-5);
        
        make.width.equalTo(@[buttonCenter, buttonRight]);
        make.height.equalTo(@90);
    }];

    [buttonCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scroller.mas_bottom).offset(5);
        make.right.equalTo(buttonRight.mas_left).offset(-5);
        make.height.equalTo(@90);
    }];
    
    [buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scroller.mas_bottom).offset(5);
        make.height.equalTo(@90);
        make.right.equalTo(self.view.mas_right).offset(-5);
    }];
    
    return;
      
//    // Style
//    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0,button.frame.size.height+button.frame.origin.y+6 , self.view.frame.size.width, 44)];
//    [img sd_setImageWithURL:[NSURL URLWithString:dummyImage2]];
//    img.backgroundColor=[UIColor clearColor];
//    [scrollView addSubview:img];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scroller View delegate

- (void)NNScrollerViewDidClicked:(NSUInteger)index {
}

- (void)btnNewProducts:(id)sender {
    DDLogVerbose(@"Button %ld", ((UIButton *)sender).tag);
    
//    NNHomeViewController *productList = [NNHomeViewController new];
    
    NNProductListViewController *productList = [NNProductListViewController new];

    [AppDelegateM.navigationController pushViewController:productList animated:YES];
}

@end
