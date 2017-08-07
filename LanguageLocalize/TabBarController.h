//
//  TabBarController.h
//  LanguageLocalize
//
//  Created by fcz on 2017/6/5.
//  Copyright © 2017年 com.labang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTabBar.h"

@interface TabBarController : UITabBarController <FTabBarDelegate>

@property (nonatomic, strong) FTabBar *myTabBar;

@end
