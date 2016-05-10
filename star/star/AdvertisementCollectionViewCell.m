//
//  AdvertisementCell.m
//  star
//
//  Created by Eric Chen on 16/5/10.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "AdvertisementCollectionViewCell.h"
#import <SDCycleScrollView.h>
@interface AdvertisementCollectionViewCell()<SDCycleScrollViewDelegate>
@property (strong, nonatomic) NSArray* imagesArr;
@property (strong, nonatomic) SDCycleScrollView* cycleScrollView;
@end

@implementation AdvertisementCollectionViewCell

NSString* const reusedAdvertisementCollectionViewCell = @"advertisementCollectionViewCell";


+(AdvertisementCollectionViewCell *)collectionView:(UICollectionView *)collectionView
                                      forIndexPath:(NSIndexPath *)indexPath
{
    AdvertisementCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusedAdvertisementCollectionViewCell forIndexPath:indexPath];
    
    return cell;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
/**
 *layout with Image Array
 */
-(void)layoutWithObject:(id)object
{
    if ([object isKindOfClass:[NSArray class]])
    {
        self.imagesArr = (NSArray*)object;
    }
}


-(void)setImagesArr:(NSArray *)imagesArr
{
    if (self.cycleScrollView)
    {
        self.cycleScrollView.autoScroll = NO;
        [self.cycleScrollView removeFromSuperview];
        self.cycleScrollView = nil;
    }
    _imagesArr = imagesArr;
    if (_imagesArr != nil && self.cycleScrollView == nil)
    {
        SDCycleScrollView* cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth*2./3) imageNamesGroup:_imagesArr];
        cycleScrollView.placeholderImage = ImageNamed(@"star_default");
        cycleScrollView.pageDotImage = ImageNamed(@"pagecontrol0");
        cycleScrollView.currentPageDotImage = ImageNamed(@"pagecontrol1");
        cycleScrollView.infiniteLoop = YES;
        cycleScrollView.delegate = self;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        [self.contentView addSubview:cycleScrollView];
        self.cycleScrollView = cycleScrollView;
    }
}

#pragma mark - SDCycleScrollViewDelegate

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView
  didSelectItemAtIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(advertisementCell:didSelecetedAtIndex:)])
    {
        [self.delegate advertisementCell:self didSelecetedAtIndex:index];
    }
}
@end
