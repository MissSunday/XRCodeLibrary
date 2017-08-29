//
//  XRNavViewController.m
//  XRCodeLibrary
//
//  Created by apple on 2017/7/8.
//  Copyright © 2017年 xiaoRan. All rights reserved.
//

#import "XRNavViewController.h"

@interface XRNavViewController ()

@end

@implementation XRNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     第一种做法
     -注意这里一定要用动画的方式隐藏导航栏,这样在使用滑动返回手势的时候效果最好,和上面动图一致.这样做有一个缺点就是在切换tabBar的时候有一个导航栏向上消失的动画.
     
     - (void)viewWillAppear:(BOOL)animated {
        [super viewWillAppear:animated];
     
        [self.navigationController setNavigationBarHidden:YES animated:YES];
     }
     
     - (void)viewWillDisappear:(BOOL)animated {
        [super viewWillDisappear:animated];
     
        [self.navigationController setNavigationBarHidden:NO animated:YES];
     }
     
     */
    
    /*
     第二种做法
     设置self为导航控制器的代理,实现代理方法,在将要显示控制器中设置导航栏隐藏和显示,使用这种方式不仅完美切合滑动返回手势,同时也解决了切换tabBar的时候,导航栏动态隐藏的问题.
     @interface WLHomePageController () <UINavigationControllerDelegate>
     
     @end
     
     @implementation WLHomePageController
     
     #pragma mark - lifeCycle
     - (void)viewDidLoad {
        [super viewDidLoad];
     
        // 设置导航控制器的代理为self
        self.navigationController.delegate = self;
     }
     
     #pragma mark - UINavigationControllerDelegate
     // 将要显示控制器
     - (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
        // 判断要显示的控制器是否是自己
        BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
     
        [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
     }
     
     */


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
