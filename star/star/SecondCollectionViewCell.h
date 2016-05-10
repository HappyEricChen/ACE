//
//  SecondCollectionViewCell.h
//  star
//
//  Created by Eric Chen on 16/5/10.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface SecondCollectionViewCell : BaseCollectionViewCell

/**
 *  create SecondCollectionViewCell instance
 */
+(SecondCollectionViewCell*)secondCollectionView:(UICollectionView*)collectionView
                                forIndexPath:(NSIndexPath*)indexPath;
/**
 *  SecondCollectionViewCell reuse Identifier
 */
extern NSString* const reusedSecondCollectionViewCell;

@end
