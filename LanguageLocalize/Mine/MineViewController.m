//
//  MineViewController.m
//  LanguageLocalize
//
//  Created by fcz on 2017/6/5.
//  Copyright © 2017年 com.labang. All rights reserved.
//

#import "MineViewController.h"
#import "Tools.h"
#import "Config.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:LanguageNotify object:nil];
    
    [self setUpNav];
}

- (void)setUpNav
{
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:Local_c(@"Set") style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)setting
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"设置应用语言" message:@"请选择您需要的语言环境" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *simpleChinese = [UIAlertAction actionWithTitle:@"简体中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self settingLanguage:SimpleChinese];
    }];
    UIAlertAction *traditionalChinese = [UIAlertAction actionWithTitle:@"繁体中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self settingLanguage:TraditionalChinese];
    }];
    UIAlertAction *english = [UIAlertAction actionWithTitle:@"英文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self settingLanguage:English];
    }];
    [alertController addAction:simpleChinese];
    [alertController addAction:traditionalChinese];
    [alertController addAction:english];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)settingLanguage:(LanguageType)type
{
    [Tools setAppLanguage:type];
    [[NSNotificationCenter defaultCenter] postNotificationName:LanguageNotify object:nil];
}

- (void)changeLanguage
{
    self.navigationItem.rightBarButtonItem.title = Local_c(@"Set");
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
