//
//  CustomNavigationView.m
//  star
//
//  Created by Eric Chen on 16/5/9.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "CustomNavigationView.h"
@interface CustomNavigationView()
@property (weak, nonatomic) UIButton* leftBtn;
@property (weak, nonatomic) UILabel* titleLabel;
@property (weak, nonatomic) UIButton* rightBtn;
@property (weak, nonatomic) UIView* lineView;
@property (weak, nonatomic) UIImageView* logoImageView;
@end
@implementation CustomNavigationView
CGFloat const NavigationViewBasicHeight = 64.f;
+(CustomNavigationView*)customNavigationViewWithLeftBtnImage:(UIImage*)leftImage
                                           withRightBtnImage:(UIImage*)rightImage
                                                   withTitle:(NSString*)title
{
    CustomNavigationView* customNavigationView = [[CustomNavigationView alloc] init];
    customNavigationView.backgroundColor = UIColorFromRGB(0xffffff);
    UIButton* leftBtn = [[UIButton alloc]init];
    [leftBtn addTarget:customNavigationView
                action:@selector(leftBtnAction:)
      forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:leftImage
             forState:UIControlStateNormal];
    leftBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [customNavigationView addSubview:leftBtn];
    customNavigationView.leftBtn = leftBtn;
    
    UIButton* rightBtn = [[UIButton alloc]init];
    [rightBtn addTarget:customNavigationView
                 action:@selector(rightBtnAction:)
       forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:rightImage
              forState:UIControlStateNormal];
    rightBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [customNavigationView addSubview:rightBtn];
    customNavigationView.rightBtn = rightBtn;
    
    UILabel* titleLabel = [[UILabel alloc]init];
    titleLabel.font = FONT_PROXIMANOVA_SEMIBOLD(18);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = UIColorFromRGB(0x4a4a4a);
    titleLabel.text = title;
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [customNavigationView addSubview:titleLabel];
    customNavigationView.titleLabel = titleLabel;
    
    UIView* lineView = [[UIView alloc]init];
    lineView.backgroundColor = UIColorFromRGB(0xd5d5d5);
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    lineView.hidden = NO;
    [customNavigationView addSubview:lineView];
    customNavigationView.lineView = lineView;
    
    
    leftBtn.sd_layout.leftSpaceToView(customNavigationView,10).topSpaceToView(customNavigationView,10).bottomSpaceToView(customNavigationView,10).widthEqualToHeight();
    rightBtn.sd_layout.rightSpaceToView(customNavigationView,10).topSpaceToView(customNavigationView,10).bottomSpaceToView(customNavigationView,10).widthEqualToHeight();
    titleLabel.sd_layout.topSpaceToView(customNavigationView,10).bottomSpaceToView(customNavigationView,10).leftSpaceToView(leftBtn,0).rightSpaceToView(rightBtn,0);
    lineView.sd_layout.leftEqualToView(customNavigationView).bottomEqualToView(customNavigationView).rightEqualToView(customNavigationView).heightIs(1);
    
    
    
    return customNavigationView;
}
//+(CustomNavigationView*)customNavigationViewWithLogoImage:(UIImage*)logoImage
//                                        withRightBtnImage:(UIImage*)rightImage
//                                         withLeftBtnImage:(UIImage*)leftImage
//{
//    CustomNavigationView* customNavigationView = [[CustomNavigationView alloc]init];
//    customNavigationView.backgroundColor = UIColorFromRGB(0xffffff);
//    
//    UIView* lineView = [[UIView alloc]init];
//    lineView.backgroundColor = UIColorFromRGB(0xdcdcdc);
//    [customNavigationView addSubview:lineView];
//    lineView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    UIImageView* logoImageView = [[UIImageView alloc]init];
//    logoImageView.contentMode = UIViewContentModeScaleAspectFit;
//    logoImageView.image = logoImage;
//    [customNavigationView addSubview:logoImageView];
//    logoImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    customNavigationView.logoImageView = logoImageView;
//    
//    UIButton* rightBtn = [[UIButton alloc]init];
//    [rightBtn addTarget:customNavigationView
//                 action:@selector(rightBtnAction:)
//       forControlEvents:UIControlEventTouchUpInside];
//    rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [rightBtn setImage:rightImage
//              forState:UIControlStateNormal];
//    [customNavigationView addSubview:rightBtn];
//    rightBtn.translatesAutoresizingMaskIntoConstraints = NO;
//    customNavigationView.rightBtn = rightBtn;
//    
//    UIButton* leftBtn = [[UIButton alloc]init];
//    [leftBtn addTarget:customNavigationView
//                action:@selector(leftBtnAction:)
//      forControlEvents:UIControlEventTouchUpInside];
//    leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [leftBtn setImage:leftImage
//             forState:UIControlStateNormal];
//    [customNavigationView addSubview:leftBtn];
//    leftBtn.translatesAutoresizingMaskIntoConstraints = NO;
//    customNavigationView.leftBtn = leftBtn;
//    
//
//    return customNavigationView;
//}
-(void)leftBtnAction:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(didSelectedLeftButtonAtCustomNavigationView:)])
    {
        [self.delegate didSelectedLeftButtonAtCustomNavigationView:self];
    }
}
-(void)rightBtnAction:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(didSelectedRightButtonAtCustomNavigationView:)])
    {
        [self.delegate didSelectedRightButtonAtCustomNavigationView:self];
    }
}
-(void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = _title;
}
//-(void)updateInteralControlsLayoutWithNavigationHeight:(CGFloat)height
//{
//    /**
//     * type checking. the method only is used for the navigationview that contain logo image view
//     */
//    if (self.logoImageView)
//    {
//        self.logoImageViewHeightConstraint.constant = .5* height;
//        self.logoImageViewWidthConstraint.constant = 3.65 * self.logoImageViewHeightConstraint.constant;
//        self.rightBtnHeightConstraint.constant = self.logoImageViewHeightConstraint.constant;
//        self.rightBtnWidthConstraint.constant = self.rightBtnHeightConstraint.constant;
//        self.rightBtn.alpha = height/44.;
//        self.logoImageView.alpha = self.rightBtn.alpha;
//        self.lineView.alpha = self.rightBtn.alpha;
//    }
//}
-(void)setTitleColor:(UIColor*)color
{
    if ([color isKindOfClass:[UIColor class]])
    {
        self.titleLabel.textColor = color;
        self.lineView.backgroundColor = UIColorFromRGB(0x000000);
    }
}
-(void)setNavigationViewlineViewHidden:(BOOL)hidden
{
    self.lineView.hidden = hidden;
}
-(void)rightButtonHidden:(BOOL)hidden
{
    self.rightBtn.hidden = hidden;
}
-(void)layoutRightButtonImageWithObject:(id)object
{
    if ([object isKindOfClass:[UIImage class]])
    {
        [self.rightBtn setImage:object forState:UIControlStateNormal];
    }
}

@end
