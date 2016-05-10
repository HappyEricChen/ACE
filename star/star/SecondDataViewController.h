//
//  SecondDataViewController.h
//  star
//
//  Created by Eric Chen on 16/5/9.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CustomNavigationView;

@interface SecondDataViewController : NSObject
/**
 * navigation view
 */
@property (strong, nonatomic) CustomNavigationView* navigationView;
/**
 *  collection View
 */
@property (strong, nonatomic) UICollectionView* collectionView;
/**
 *  scrollView array(up on the page)
 */
@property (strong, nonatomic) NSMutableArray* scrollViewArr;
/**
 *  collectionView array
 */
@property (strong, nonatomic) NSMutableArray* collectionViewArr;

/**
 *  load data
 */
-(void)loadDataAndRefresh;
@end
