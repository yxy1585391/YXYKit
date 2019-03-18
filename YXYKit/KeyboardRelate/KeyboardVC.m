//
//  KeyboardVC.m
//  YXYKit
//
//  Created by 燕晓玉 on 2019/3/18.
//  Copyright © 2019 yxy. All rights reserved.
//

#import "KeyboardVC.h"

@interface KeyboardVC ()

@end

@implementation KeyboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *tf = [[UITextField alloc] init];
    tf.frame = CGRectMake(50, 200, 200, 40);
    tf.placeholder = @"请输入手机号";
    tf.layer.borderColor = [UIColor lightGrayColor].CGColor;
    tf.layer.borderWidth = 1;
    tf.layer.cornerRadius = 2;
    tf.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    tf.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:tf];
    
    
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
