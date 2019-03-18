//
//  UIView+NoData.m
//  Angelet
//
//  Created by 燕晓玉 on 2019/1/10.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UIView+NoData.h"
#import <objc/runtime.h>

static const char noDataKey;

@implementation UIView (NoData)

- (void)removeNoDataView{
    UIView *view = [self viewWithTag:10241];
    if (view) {
        UIScrollView *scrollV = [self viewWithTag:10240];
        if (scrollV.mj_header.refreshing) {
            [scrollV.mj_header endRefreshingWithCompletionBlock:^{
                UIView *view = [self viewWithTag:10241];
                [view removeFromSuperview];
            }];
        }else{
            [SVProgressHUD dismiss];
            UIView *view = [self viewWithTag:10241];
            [view removeFromSuperview];
        }
    }
}

- (void)addNoDataStatusImageName:(NSString *)imgName textDescribe:(NSString *)text finishBlock:(void (^)(void))block{
    
    UIView *bgView = [[UIView alloc] init];
    bgView.tag  = 10241;
    [self addSubview:bgView];
    bgView.backgroundColor = [UIColor whiteColor];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UIScrollView *scrollV = [[UIScrollView alloc] init];
    scrollV.tag  = 10240;
    [bgView addSubview:scrollV];
    [scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    [bgView addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(105+k_Height_NavBar);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    imageV.image = [UIImage imageNamed:imgName];
    
    UILabel *desLab = [[UILabel alloc] init];
    [bgView addSubview:desLab];
    [desLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(imageV.mas_bottom).with.offset(40);
    }];
    desLab.font = [UIFont systemFontOfSize:12];
    desLab.textColor = RGBCOLOR(153, 153, 153);
    desLab.text = text;
    
    if (block) {
        scrollV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];

        [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickNoDataView)]];
        objc_setAssociatedObject(self, &noDataKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)clickNoDataView{
    [SVProgressHUD showWithStatus:nil];
    void(^block)(void) = objc_getAssociatedObject(self, &noDataKey);
    if (block) {
        block();
    }
}

@end
