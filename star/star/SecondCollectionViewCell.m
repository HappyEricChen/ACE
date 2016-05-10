//
//  SecondCollectionViewCell.m
//  star
//
//  Created by Eric Chen on 16/5/10.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "SecondCollectionViewCell.h"
@interface SecondCollectionViewCell()
@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *contentLabel;
@property (weak, nonatomic) UILabel *totalLabel;
@end
@implementation SecondCollectionViewCell
NSString * const reusedSecondCollectionViewCell = @"secondCollectionViewCell";
+(SecondCollectionViewCell *)secondCollectionView:(UICollectionView *)collectionView
                                     forIndexPath:(NSIndexPath *)indexPath
{
    SecondCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusedSecondCollectionViewCell
                                                                               forIndexPath:indexPath];
    return cell;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.image = ImageNamed(@"star_default");
        [self.contentView addSubview:imageView];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        self.imageView = imageView;
        
        UILabel* titleLabel = [[UILabel alloc]init];
        titleLabel.textColor = UIColorFromRGB(0x000000);
        titleLabel.font = FONT_PROXIMANOVA_BOLD(16);
        titleLabel.numberOfLines = 1;
        [self.contentView addSubview:titleLabel];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel = titleLabel;
        
        UILabel* contentLabel = [[UILabel alloc]init];
        contentLabel.textColor = UIColorFromRGB(0x000000);
        contentLabel.font = FONT_PROXIMANOVA_REGULAR(14);
        contentLabel.numberOfLines = 1;
        [self.contentView addSubview:contentLabel];
        contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.contentLabel = contentLabel;
        
        UILabel* totalLabel = [[UILabel alloc]init];
        totalLabel.textColor = UIColorFromRGB(0xff8c00);
        totalLabel.font = FONT_PROXIMANOVA_REGULAR(14);
        totalLabel.numberOfLines = 1;
        [self.contentView addSubview:totalLabel];
        totalLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.totalLabel = totalLabel;
        
        imageView.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).bottomSpaceToView(self.contentView,10).widthEqualToHeight();
        titleLabel.sd_layout.leftSpaceToView(imageView,10).topSpaceToView(self.contentView,20).widthIs(150);
        contentLabel.sd_layout.leftEqualToView(titleLabel).topSpaceToView(titleLabel,10).rightSpaceToView(self.contentView,10);
        totalLabel.sd_layout.leftSpaceToView(titleLabel,10).topEqualToView(titleLabel).rightSpaceToView(self.contentView,10);
    }
    return self;
}

-(void)layoutWithObject:(id)object
{
    if ([object isKindOfClass:[UIImage class]])
    {
        self.titleLabel.text = @"helloworld";
        self.contentLabel.text = @"description about star";
        self.imageView.image = (UIImage*)object;
        self.totalLabel.text = @"今日4.5万条";
    }
}
@end
