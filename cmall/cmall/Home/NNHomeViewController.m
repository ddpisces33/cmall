//
//  NNHomeViewController.m
//  cmall
//
//  Created by ddpisces on 15/7/31.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import "NNHomeViewController.h"
#import "NNScrollerView.h"

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
    
    NSArray *array = @[@{@"image":@"aa", @"link":@"link"}, @{@"image":@"bb", @"link":@"link"},];
    
    NNScrollerView *scroller = [[NNScrollerView alloc] initWithFrameRect:CGRectMake(0, 0, 320, 160)
                                                          scrolArray:[NSArray arrayWithArray:array] needTitile:YES];
    scroller.delegate = self;
    scroller.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:scroller];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
