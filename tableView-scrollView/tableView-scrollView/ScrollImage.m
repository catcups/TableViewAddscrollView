//
//  ScrollImage.m
//  tableViewCell-collectionViewCell
//
//  Created by qh on 16/5/23.
//  Copyright © 2016年 qh. All rights reserved.
//

#import "ScrollImage.h"
@interface ScrollImage ()<UIScrollViewDelegate> {
    CGRect backFrame; // 传来的frame
    CGFloat Margin; // margin为两边空隙宽度
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *imageArr; // 外界传来的图片数组
@end
@implementation ScrollImage
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, backFrame.size.height)];
        _scrollView.contentSize = CGSizeMake(backFrame.size.width * _imageArr.count, 0);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame withArray:(NSMutableArray *)array {
    self = [super initWithFrame:frame];
    if (self) {
        _imageArr = array;
        backFrame = frame;
        CGFloat kWidth = frame.size.width * _imageArr.count;
        CGRect Frame = self.frame;
        Frame.size.width = kWidth;
        self.frame = Frame;
        // 触发懒加载
        self.scrollView.backgroundColor = [UIColor clearColor];
        [self addImageViewArr];
    }
    return self;
}

- (void)addImageViewArr {
    NSInteger index = 0;
    for (UIImage *image in _imageArr) {
        UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
        imageV.frame = CGRectMake(index * backFrame.size.width, 0, backFrame.size.width, backFrame.size.height);
        // 给图片加手势
        imageV.userInteractionEnabled = YES;
        imageV.tag = index;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        [imageV addGestureRecognizer:tap];
        [_scrollView addSubview:imageV];
        index++;
    }
}
- (void)click:(UITapGestureRecognizer *)sender {
    UIImageView *imageVV = (UIImageView *)sender.view;
    NSLog(@"第%ld张图片", imageVV.tag);
}

@end
