//
//  FTabBar.h
//  LanguageLocalize
//
//  Created by fcz on 2017/6/5.
//  Copyright © 2017年 com.labang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FTabBar;

@protocol FTabBarDelegate <NSObject>

@optional
- (void)tabBarPlusBtnClick:(FTabBar *)tabBar;

@end

@interface FTabBar : UITabBar

@property (nonatomic, weak) UILabel *plusLabel;

/**tabBar的代理**/

@property (weak, nonatomic) id<FTabBarDelegate> myDelegate;

@end
