//
//  NoDataVC.m
//  YXYKit
//
//  Created by 燕晓玉 on 2019/3/18.
//  Copyright © 2019 yxy. All rights reserved.
//

#import "NoDataVC.h"
#import "UIView+NoData.h"

@interface NoDataVC ()

@end

@implementation NoDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    WeakSelf(self)
    [self.view addNoDataStatusImageName:@"no_data" textDescribe:@"暂无数据" finishBlock:^{
        StrongSelf(self)
        NSLog(@"点击刷新");
        [strongself performSelector:@selector(cancel) withObject:nil afterDelay:2];
    }];
}

- (void)cancel{
    [self.view removeNoDataView];
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
