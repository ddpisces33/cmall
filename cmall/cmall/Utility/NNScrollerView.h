//
//  NNScrollerView.h
//  cmall
//
//  Created by ddpisces on 15/8/5.
//  Copyright (c) 2015年 NAONAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNScrollerViewDelegate <NSObject>

@optional

- (void)NNScrollerViewDidClicked:(NSUInteger)index;

@end


@interface NNScrollerView : UIView <UIScrollViewDelegate> {
    CGRect viewSize;
    UIScrollView *scrollView;
    NSArray *imageArray;
    NSMutableArray *linkArray;
    UIPageControl *pageControl;
    NSInteger currentPageIndex;
    UILabel *noteTitle;
}

@property(nonatomic, weak)    id <NNScrollerViewDelegate> delegate;
@property(nonatomic, strong)  NSArray *showArray;

-(instancetype)initWithFrameRect:(CGRect)rect scrolArray:(NSArray *)array needTitile:(BOOL)isNeedTitle;

@end
