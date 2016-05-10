//
//  AppDelegateHelper.m
//  star
//
//  Created by Eric Chen on 16/5/2.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "AppDelegateHelper.h"
#import <JZNavigationExtension.h>
#import "HomeViewController.h"
#import "RDVTabBarController.h"
#import "macro.h"
#import "ImageAssert.h"
#import "RDVTabBarItem.h"
#import "SecondViewController.h"

@implementation AppDelegateHelper
#pragma mark Class method
+ (AppDelegateHelper*)sharedHelper
{
    static AppDelegateHelper *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark lazy load
-(UINavigationController*)mainNavigationController
{
    if (!_mainNavigationController)
    {
        _mainNavigationController = [[UINavigationController alloc]initWithRootViewController:self.mainTabBarController];
        _mainNavigationController.jz_fullScreenInteractivePopGestureEnabled = YES;
        
    }
    return _mainNavigationController;
}

-(UIViewController *)homeViewController
{
    if (!_homeViewController)
    {
        _homeViewController = [[HomeViewController alloc]init];
    }
    return _homeViewController;
}

-(UIViewController *)secondViewController
{
    if (!_secondViewController)
    {
        _secondViewController = [[SecondViewController alloc]init];
    }
    return _secondViewController;
}
-(UIViewController *)thirdViewController
{
    if (!_thirdViewController)
    {
        _thirdViewController = [[HomeViewController alloc]init];
    }
    return _thirdViewController;
}
-(UIViewController *)fourViewController
{
    if (!_fourViewController)
    {
        _fourViewController = [[HomeViewController alloc]init];
    }
    return _fourViewController;
}

-(UIViewController *)mainTabBarController
{
    if (!_mainTabBarController)
    {
        RDVTabBarController* rdvTabBarController = [[RDVTabBarController alloc]init];
        [rdvTabBarController setViewControllers:@[self.homeViewController,
                                                  self.secondViewController,
                                                  self.thirdViewController,
                                                  self.fourViewController]];
        
        NSArray* selectedImages = @[ImageNamed(ig_home_full),
                                    ImageNamed(ig_discover_full),
                                    ImageNamed(ig_shop_activity_full),
                                    ImageNamed(ig_me_full)];
        NSArray* unselectedImages = @[ImageNamed(ig_home_line),
                                      ImageNamed(ig_discover_line),
                                      ImageNamed(ig_shop_activity_line),
                                      ImageNamed(ig_me_line)];
        NSInteger index = 0;
        for (RDVTabBarItem* item in [[rdvTabBarController tabBar]items])
        {
            [item setBackgroundColor:UIColorFromRGB(0x000000)];
            [item setFinishedSelectedImage:selectedImages[index]
               withFinishedUnselectedImage:unselectedImages[index]];
            index++;
        }
        _mainTabBarController = rdvTabBarController;
    }
    return _mainTabBarController;
}
@end
