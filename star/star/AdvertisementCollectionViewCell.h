//
//  AdvertisementCollectionViewCell.h
//  star
//
//  Created by Eric Chen on 16/5/10.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "BaseCollectionViewCell.h"
@class AdvertisementCollectionViewCell;
@protocol AdvertisementCollectionViewCellDelegate <NSObject>

@optional
/**
 *  optional delegate method
 */
-(void)advertisementCell:(AdvertisementCollectionViewCell*)advertisementCollectionViewCell didSelecetedAtIndex:(NSUInteger)index;

@end

@interface AdvertisementCollectionViewCell : BaseCollectionViewCell
/**
 *  create  collectionView
 */
+(AdvertisementCollectionViewCell *)collectionView:(UICollectionView *)collectionView
                                      forIndexPath:(NSIndexPath *)indexPath;

/**
 *  collectionCell reused identifier
 */
extern NSString* const reusedAdvertisementCollectionViewCell;
@property (weak, nonatomic) id<AdvertisementCollectionViewCellDelegate> delegate;
@end
