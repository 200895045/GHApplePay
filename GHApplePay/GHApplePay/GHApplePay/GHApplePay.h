//
//  GHApplePay.h
//  GHApplePay
//
//  Created by shen_gh on 16/3/1.
//  Copyright © 2016年 com.joinup(Beijing). All rights reserved.
//

/**
 *  快速接入Apple Pay
 *
 */

#import <Foundation/Foundation.h>
#import<PassKit/PassKit.h> //这是苹果提供给开发者ApplePay操作相关的kit

@protocol GHApplePayDelegate <NSObject>

/**
 *  支付成功
 */
- (void)GHApplePayDidSuccess;

/**
 *  支付失败
 */
- (void)GHApplePayDidFailure;

@end

@interface GHApplePay : NSObject
<PKPaymentAuthorizationViewControllerDelegate>

@property (nonatomic,assign) id<GHApplePayDelegate>delegate;

/**
 *  初始化init  创建
 *
 *  @param payReceiver 收款方
 *  @param amount      金额
 *
 *  @return self
 */
- (instancetype)initWithPayReceiver:(NSString *)payReceiver amount:(NSString *)amount presentVC:(UIViewController *)vc;

@end
