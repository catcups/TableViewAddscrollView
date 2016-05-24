//
//  ViewController.m
//  tableView-scrollView
//
//  Created by qh on 16/5/24.
//  Copyright © 2016年 qh. All rights reserved.
//

#import "ViewController.h"
#import "ScrollImage.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    UIImage *image1 = [UIImage imageNamed:@"12.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"19.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"25.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"29.jpg"];
    NSMutableArray *array = @[image1, image2, image3, image4, image1, image2, image3, image4].mutableCopy;
    ScrollImage *scrImage = [[ScrollImage alloc] initWithFrame:CGRectMake(0, 10, 100, 180) withArray:array];
    [cell.contentView addSubview:scrImage];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
