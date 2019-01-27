//
//  YNPayPasswordView.h
//  O2O
//
//  Created by Abel on 16/11/9.
//  Copyright © 2016年 yunshanghui. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YNPayPasswordView;

typedef void (^InputViewBtnBlock)(YNPayPasswordView *inputView, NSInteger buttonIndex, NSString *inputText);

typedef void (^InputViewDismissBlock)(void);

@interface YNPayPasswordView : UIView <UITextFieldDelegate>

/*! @brief 初始化
 * @param title 输入框标题
 * @param subTitle 输入框Sub标题
 * @param bttonArray 按钮数组
 * @param font 输入框字体
 * @param block 输入框按钮回调
 * @param dismissBlock 输入框消失回调
 */
-(instancetype)initWithTitle:(NSString *)title
                WithSubTitle:(NSString *)subTitle
                  WithButton:(NSArray * _Nonnull )bttonArray
               withTitleFont:(UIFont *)font
                      handle:(InputViewBtnBlock)block
                     dismiss:(InputViewDismissBlock)dismissBlock;

/*! @brief 密码点
 */
-(void)hiddenAllPoint;

/*! @brief 界面展示
 */
-(void)show;

/*! @brief 界面移除
 */
-(void)removeFromView;

@end
