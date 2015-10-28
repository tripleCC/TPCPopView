//
//  ViewController.m
//  TPCPopView
//
//  Created by tripleCC on 15/10/27.
//  Copyright © 2015年 tripleCC. All rights reserved.
//

#import "ViewController.h"
#import "TPCPopView.h"

@interface ViewController ()<TPCPopViewDelegate, TPCPopViewDataSource>

@property (weak, nonatomic) UIView *view1;
@property (weak, nonatomic) UIView *view2;
@property (weak, nonatomic) UIView *view3;
@property (strong, nonatomic) NSArray *messages;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.messages = [NSArray arrayWithObjects:@"小组通知", @"加入的小组", @"发表的话题", @"收藏的话题",nil];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    view.backgroundColor = [UIColor redColor];
    self.view1 = view;
    [self.view addSubview:view];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(200, 300, 20, 20)];
    view.backgroundColor = [UIColor redColor];
    self.view2 = view;
    [self.view addSubview:view];
    
    view = [[UIView alloc] initWithFrame:CGRectMake(100, 500, 20, 20)];
    view.backgroundColor = [UIColor redColor];
    self.view3 = view;
    [self.view addSubview:view];
}

- (UITableViewCell *)popView:(TPCPopView *)popView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.messages[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:8];
    cell.imageView.image = [UIImage imageNamed:@"1"];
    
    return cell;
}

- (NSInteger)popView:(TPCPopView *)popView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

- (void)popView:(TPCPopView *)popView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [TPCPopView showWithContainerSize:CGSizeMake(110, 140) fromView:self.view1 fadeDirection:TPCPopViewFadeDirectionCenter dataSource:self delegate:self];
    [TPCPopView showMessages:self.messages withContainerSize:CGSizeMake(110, 140) fromView:self.view2 fadeDirection:TPCPopViewFadeDirectionRightTop clickActionBlock:^(NSInteger row) {
        NSLog(@"%ld", row);
    }];
    [TPCPopView showMessages:self.messages withContainerSize:CGSizeMake(110, 140) fromView:self.view3 fadeDirection:TPCPopViewFadeDirectionLeftTop clickActionBlock:^(NSInteger row) {
        NSLog(@"%ld", row);
    }];
}
@end
