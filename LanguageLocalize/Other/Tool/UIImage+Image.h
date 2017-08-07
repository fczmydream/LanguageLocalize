//
//  UIImage+Image.h
//  LanguageLocalize
//
//  Created by fcz on 2017/6/5.
//  Copyright © 2017年 com.labang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

/**
 *  根据颜色生成一张图片
 *  @param color 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
