//
//  FootNavigationController.m
//  Foot
//
//  Created by 吴迪玮 on 15/5/12.
//  Copyright (c) 2015年 pandoranews. All rights reserved.
//

#import "FootNavigationController.h"

#define NAVIGATION_BACKGROUND_COLOR [UIColor whiteColor]
#define RUNMOVE_TEXT_GRAY_COLOR ([UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1.0])

@interface FootNavigationController ()

@end

@implementation FootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置导航栏属性
    [[UINavigationBar appearance] setBarTintColor:NAVIGATION_BACKGROUND_COLOR];
    [[UINavigationBar appearance] setTintColor:RUNMOVE_TEXT_GRAY_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:RUNMOVE_TEXT_GRAY_COLOR}];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 设置导航栏属性
    [viewController.navigationController.navigationBar setBarTintColor:NAVIGATION_BACKGROUND_COLOR];
    [viewController.navigationController.navigationBar setTintColor:RUNMOVE_TEXT_GRAY_COLOR];
    [viewController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:RUNMOVE_TEXT_GRAY_COLOR}];
    viewController.navigationController.navigationBar.barStyle = UIBarStyleDefault;

    //    self.view.backgroundColor=NAVIGATION_BACKGROUND_COLOR;
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    self.navigationBar.translucent=NO;
    if ([viewController isKindOfClass:[self.viewControllers[0] class]]) {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    

    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                                initWithTitle:@"返回"
                                style:UIBarButtonItemStylePlain
                                target:nil
                                action:nil];
    viewController.navigationItem.backBarButtonItem = btnBack;

}

- (void)backMethod
{
    [self popViewControllerAnimated:YES];
}


-(void)pushViewControllerAnimated:(UIViewController*)viewController{
    
    
    [super pushViewController:viewController animated:YES];
}
@end
