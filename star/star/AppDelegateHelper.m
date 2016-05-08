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
#import "TopicViewController.h"

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
        _mainNavigationController = [[UINavigationController alloc]initWithRootViewController:self.homeViewController];
        _mainNavigationController.jz_fullScreenInteractivePopGestureEnabled = YES;
        
    }
    return _mainNavigationController;
}

-(UINavigationController*)topicNavigationController
{
    if (!_topicNavigationController)
    {
        _topicNavigationController = [[UINavigationController alloc]initWithRootViewController:self.topicViewController];
        _topicNavigationController.jz_fullScreenInteractivePopGestureEnabled = YES;
        
    }
    return _topicNavigationController;
}


-(UITabBarController *)mainTabBarController
{
    if (!_mainTabBarController)
    {
        _mainTabBarController = [[UITabBarController alloc]init];
        _mainTabBarController.viewControllers = @[self.mainNavigationController,self.topicNavigationController];
      //  [_mainTabBarController addChildViewController:self.mainNavigationController];
    }
    return _mainTabBarController;
}

-(UIViewController *)homeViewController
{
    if (!_homeViewController)
    {
        _homeViewController = [[HomeViewController alloc]init];
    }
    return _homeViewController;
}


-(UIViewController *)topicViewController {
    if (!_topicViewController)
    {
        _topicViewController = [[TopicViewController alloc]init];
    }
    return _topicViewController;
}
@end
