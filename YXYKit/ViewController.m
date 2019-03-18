//
//  ViewController.m
//  YXYKit
//
//  Created by 燕晓玉 on 2019/3/17.
//  Copyright © 2019 yxy. All rights reserved.
//

#import "ViewController.h"
#import "NoDataVC.h"
#import "KeyboardRelate/KeyboardVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArr = @[@"noDataView", @"keyboardVC"];
    [self initSubviews];
}

- (void)initSubviews{
    _myTableView = [[UITableView alloc] init];
    [self.view addSubview:_myTableView];
    _myTableView.tableFooterView = [[UIView alloc] init];
    _myTableView.frame = CGRectMake(0, k_Height_NavBar, SCREEN_WIDTH, SCREEN_HEIGHT-k_Height_NavBar);
    [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    
}

#pragma mark TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        NoDataVC *noData = [[NoDataVC alloc] init];
        [self.navigationController pushViewController:noData animated:YES];
    }else{
        KeyboardVC *keyboard = [[KeyboardVC alloc] init];
        [self.navigationController pushViewController:keyboard animated:YES];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
