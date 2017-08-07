//
//  TabBarController.m
//  LanguageLocalize
//
//  Created by fcz on 2017/6/5.
//  Copyright © 2017年 com.labang. All rights reserved.
//

#import "TabBarController.h"
#import "FNavigationController.h"
#import "HomeViewController.h"
#import "FishViewController.h"
#import "PostViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "Tools.h"
#import "Config.h"

@interface TabBarController ()


@end

@implementation TabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpAllChildVC];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    _myTabBar = [[FTabBar alloc] init];
    _myTabBar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:_myTabBar forKey:@"tabBar"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:LanguageNotify object:nil];
    
}

- (void)setUpAllChildVC
{
    //闲鱼
    HomeViewController *mainVC = [[HomeViewController alloc] init];
    [self setUpOneChildVcWithVc:mainVC Image:@"home_normal" selectedImage:@"home_highlight" title:Local_c(@"XianYu")];
    //鱼塘
    FishViewController *fishVC = [[FishViewController alloc] init];
    [self setUpOneChildVcWithVc:fishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:Local_c(@"YuTang")];
    //消息
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    [self setUpOneChildVcWithVc:messageVC Image:@"message_normal" selectedImage:@"message_highlight" title:Local_c(@"Message")];
    //我的
    MineViewController *mineVC = [[MineViewController alloc] init];
    [self setUpOneChildVcWithVc:mineVC Image:@"account_normal" selectedImage:@"account_highlight" title:Local_c(@"Me")];
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    FNavigationController *nav = [[FNavigationController alloc] initWithRootViewController:Vc];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];

}

#pragma mark - ------------------------------------------------------------------
#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(FTabBar *)tabBar
{
    PostViewController *postVC = [[PostViewController alloc] init];
    FNavigationController *nav = [[FNavigationController alloc] initWithRootViewController:postVC];
    postVC.navigationItem.title = Local_c(@"Post");
    [self presentViewController:nav animated:YES completion:nil];
}

//语言
- (void)changeLanguage
{
    NSArray *navs = self.viewControllers;
    NSArray *locals = @[Local_c(@"XianYu"),Local_c(@"YuTang"),Local_c(@"Message"),Local_c(@"Me")];
    for(int i=0;i<navs.count;i++){
        UIViewController *vc = [[navs objectAtIndex:i] topViewController];
        vc.tabBarItem.title = [locals objectAtIndex:i];
        vc.navigationItem.title = [locals objectAtIndex:i];
    }
    _myTabBar.plusLabel.text = Local_c(@"Post");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
