//
//  CustomNavigationView.h
//  star
//
//  Created by Eric Chen on 16/5/9.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomNavigationView;
@protocol CustomNavigationViewDelegate <NSObject>
@optional
/**
 * delegate method. user click left button at custom navigationview
 */
-(void)didSelectedLeftButtonAtCustomNavigationView:(CustomNavigationView*)customNavigationView;
/**
 * delegate method. user click right button at custom navigationview
 */
-(void)didSelectedRightButtonAtCustomNavigationView:(CustomNavigationView*)customNavigationView;
@end
@interface CustomNavigationView : UIView
/**
 * a delegate for CustomNavigationView instance
 */
@property (weak, nonatomic) id<CustomNavigationViewDelegate>delegate;
/**
 * initial method. this initial method contain leftbtn, rightbtn and title, fixed postion
 */
+(CustomNavigationView*)customNavigationViewWithLeftBtnImage:(UIImage*)leftImage
                                           withRightBtnImage:(UIImage*)rightImage
                                                   withTitle:(NSString*)title;
/**
 * property title text type, will display in the center of navigation view
 */
@property (strong, nonatomic) NSString* title;
/**
 * initial method. this initial mothod contain logo image, rightbtn. according to layout params to modify layout size
 */
+(CustomNavigationView*)customNavigationViewWithLogoImage:(UIImage*)logoImage
                                        withRightBtnImage:(UIImage*)rightImage
                                         withLeftBtnImage:(UIImage*)leftImage;
/**
 * navigationview basic height (default 44)
 */
extern CGFloat const NavigationViewBasicHeight;
/**
 * update interal control layout (the method only support to customnavigationview - logo image)
 * interal display and layout according to the @params height modify
 */
-(void)updateInteralControlsLayoutWithNavigationHeight:(CGFloat)height;
/**
 * set title color
 */
-(void)setTitleColor:(UIColor*)color;
/*
 *  set NavigationViewl ineView Hidden
 */
-(void)setNavigationViewlineViewHidden:(BOOL)hidden;
/**
 * hide right button in some condition
 */
-(void)rightButtonHidden:(BOOL)hidden;
/**
 *  set right button image
 */
-(void)layoutRightButtonImageWithObject:(id)object;

@end
