//
//  ViewController.m
//  GHApplePay
//
//  Created by shen_gh on 16/3/1.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

#import "ViewController.h"
#import "GHApplePay.h"//导入AppelPay工具

@interface ViewController ()
<GHApplePayDelegate>

@property (nonatomic,strong) UIButton *payBtn;//支付按钮

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.payBtn];
}

- (UIButton *)payBtn{
    if (!_payBtn) {
        _payBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [_payBtn setCenter:self.view.center];
        [_payBtn setBounds:CGRectMake(0.0, 0.0, 60.0, 40.0)];
        [_payBtn setBackgroundColor:[UIColor darkGrayColor]];
        [_payBtn setTitle:@"支付" forState:UIControlStateNormal];
        [_payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_payBtn addTarget:self action:@selector(payBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payBtn;
}

- (void)payBtnClicked{
    GHApplePay *pay=[[GHApplePay alloc]initWithPayReceiver:@"申冠华" amount:@"5.20" presentVC:self];
    [pay setDelegate:self];
}

#pragma mark - GHApplePay delegate
//支付成功
- (void)GHApplePayDidSuccess{
    NSLog(@"支付成功!");
}

//支付失败
- (void)GHApplePayDidFailure{
    NSLog(@"支付失败!");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
