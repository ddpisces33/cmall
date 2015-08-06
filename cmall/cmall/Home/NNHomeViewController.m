//
//  NNHomeViewController.m
//  cmall
//
//  Created by ddpisces on 15/7/31.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import "NNHomeViewController.h"
#import "UIButton+WebCache.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NNUtility.h"

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
    
    NSInteger height = self.navigationBar.frame.size.height;
    NSInteger width  = self.navigationBar.frame.size.width;
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, height, width, self.view.frame.size.height-height-49)];
    
    [scrollView setContentSize:CGSizeMake(320, self.view.frame.size.height+120)];

    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    [self.view addSubview:scrollView];
    
    // TODO: dummy data
    NSString *dummyImage = @"http://a2.att.hudong.com/65/47/01300000145751121643476275305.jpg";
    NSString *dummyImage2 = @"http://img103.mypsd.com.cn/20130506/1/Mypsd_6736_201305060815050142B.jpg";
    
    NSArray *array = @[@{@"image":dummyImage, @"link":@"link"}, @{@"image":dummyImage2, @"link":@"link"},];
    
    NNScrollerView *scroller = [[NNScrollerView alloc] initWithFrameRect:CGRectMake(0, 0, width, 160)
                                                          scrolArray:[NSArray arrayWithArray:array] needTitile:YES];
    scroller.delegate = self;
    scroller.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:scroller];
    
    // New Products
    UIButton *button;
    for (NSInteger i = 0; i < 3; i++) {
        button = [[UIButton alloc] initWithFrame:CGRectMake(10+i*120, scroller.frame.size.height+scroller.frame.origin.y+10, 100, 90)];
        [button sd_setImageWithURL:[NSURL URLWithString:dummyImage] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnNewProducts:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        
        [scrollView addSubview:button];
    }
    
    // Style
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0,button.frame.size.height+button.frame.origin.y+6 , self.view.frame.size.width, 44)];
    [img sd_setImageWithURL:[NSURL URLWithString:dummyImage2]];
    img.backgroundColor=[UIColor clearColor];
    [scrollView addSubview:img];
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
}

@end
