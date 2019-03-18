//
//  KeyboardRelatedVC.m
//  Angelet
//
//  Created by 燕晓玉 on 2019/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

#import "KeyboardRelatedVC.h"

@interface KeyboardRelatedVC (){
    UITapGestureRecognizer *tap;
}

@end

@implementation KeyboardRelatedVC

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHiden) name:UIKeyboardWillHideNotification object:nil];
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView)];
    
    //子类    _myTableView.keyboardDismissMode = YES;
}

- (void)clickView{
    [self.view endEditing:YES];
}

- (void)keyboardWillShow{
    [self.view addGestureRecognizer:tap];
}

- (void)keyboardWillHiden{
    [self.view removeGestureRecognizer:tap];
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
