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
@end
