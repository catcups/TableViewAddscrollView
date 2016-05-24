//
//  ScrollImage.h
//  tableViewCell-collectionViewCell
//
//  Created by qh on 16/5/23.
//  Copyright © 2016年 qh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollImage : UIView
/**
 *  @frame: 外界传来的frame 即scrollView上每个UIImageView的大小
 *
 *  @Array: 外界存放UIImage的数组
 */
- (instancetype)initWithFrame:(CGRect)frame withArray:(NSMutableArray *)array;
@end
