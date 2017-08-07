//
//  Tools.m
//  LanguageLocalize
//
//  Created by fcz on 2017/6/6.
//  Copyright © 2017年 com.labang. All rights reserved.
//

#import "Tools.h"
#import "Config.h"

@implementation Tools

+ (instancetype)sharedInstance
{
    static Tools *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[Tools alloc] init];
    });
    return tool;
}

+ (NSString *)systemLanguage
{
    NSArray *languages = [NSLocale preferredLanguages];
    return [languages firstObject];
}

+ (NSString *)currentAppLanguage
{
    NSString *customLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:AppLanguage];
    if(!customLanguage){
        NSString *systemLanguage = [Tools systemLanguage];
        if([systemLanguage hasPrefix:@"zh-Hant"]){
            [Tools setAppLanguage:TraditionalChinese];
            return @"zh-Hant";
        }else if([systemLanguage hasPrefix:@"en"]){
            [Tools setAppLanguage:English];
            return @"en";
        }else{
            [Tools setAppLanguage:SimpleChinese];
            return @"zh-Hans";
        }
    }else{
        return customLanguage;
    }
}

+ (void)setAppLanguage:(LanguageType)languageType
{
    NSString *language = @"zh-Hans";
    switch (languageType) {
        case 0:
            language = @"zh-Hans";
            break;
        case 1:
            language = @"zh-Hant";
            break;
        case 2:
            language = @"en";
            break;
        default:
            break;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:AppLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)systemLocalizeForkey:(NSString *)key
{
    return [[NSBundle mainBundle] localizedStringForKey:key value:@"" table:nil];
}

- (NSString *)customLocalizeForkey:(NSString *)key
{
    NSString *customLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:AppLanguage];
    NSString *path = [[NSBundle mainBundle] pathForResource:customLanguage ofType:@"lproj"];
    return [[NSBundle bundleWithPath:path] localizedStringForKey:key value:@"" table:nil];
}

NSString * Local_s (NSString * key)
{
    return [[Tools sharedInstance] systemLocalizeForkey:key];
}

NSString * Local_c (NSString * key)
{
    return [[Tools sharedInstance] customLocalizeForkey:key];
}

@end
