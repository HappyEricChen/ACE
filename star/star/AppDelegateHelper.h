//
//  AppDelegateHelper.h
//  star
//
//  Created by Eric Chen on 16/5/2.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
/**
 * AppDelegateHelper singleton instance macro
 */
#define AppDelegateHelperSingleton [AppDelegateHelper sharedHelper]
@interface AppDelegateHelper : NSObject
/**
 * AppDelegateHelper singleton
 */
+ (AppDelegateHelper*)sharedHelper;
/**
 * return UINavigationController instance
 */
@property (strong, nonatomic) UINavigationController* mainNavigationController;
/**
 * return RDVTabBarController instance
 */
@property (strong, nonatomic) UIViewController* mainTabBarController;
/**
 * return homeViewController instance
 */
@property (strong, nonatomic) UIViewController* homeViewController;
@end
