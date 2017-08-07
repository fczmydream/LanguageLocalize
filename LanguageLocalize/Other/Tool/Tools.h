//
//  Tools.h
//  LanguageLocalize
//
//  Created by fcz on 2017/6/6.
//  Copyright © 2017年 com.labang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LanguageType) {
    SimpleChinese,
    TraditionalChinese,
    English
};

@interface Tools : NSObject

+ (instancetype)sharedInstance;

+ (NSString *)systemLanguage;  //获取设备当前系统语言

+ (NSString *)currentAppLanguage; //应用当前语言

+ (void)setAppLanguage:(LanguageType)languageType;//设置应用语言

- (NSString *)systemLocalizeForkey:(NSString *)key;

- (NSString *)customLocalizeForkey:(NSString *)key;

NSString * Local_c (NSString * key);
NSString * Local_s (NSString * key);

@end
