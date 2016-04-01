//
//  ViewController.m
//  ZZJStatusBarHUD ZZJStatusBarHUD_Demo
//
//  Created by chefuzzj on 16/4/1.
//  Copyright © 2016年 chefuzzj. All rights reserved.
//

#import "ViewController.h"
#import "ZZJStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
    [ZZJStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)error:(id)sender {
    [ZZJStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    [ZZJStatusBarHUD showLoading:@"正在加载..."];
}

- (IBAction)hide:(id)sender {
    [ZZJStatusBarHUD hide];
}

- (IBAction)showMessage:(id)sender {
    [ZZJStatusBarHUD showMessage:@"这是一条信息"];
}

@end
