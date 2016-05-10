//
//  SecondDataViewController.m
//  star
//
//  Created by Eric Chen on 16/5/9.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "SecondDataViewController.h"
#import "SecondCollectionViewCell.h"
#import "AdvertisementCollectionViewCell.h"

@implementation SecondDataViewController

-(CustomNavigationView *)navigationView
{
    if (!_navigationView)
    {
        _navigationView = [CustomNavigationView customNavigationViewWithLeftBtnImage:nil
                                                                   withRightBtnImage:nil
                                                                           withTitle:@"讨论区"];
        _navigationView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _navigationView;
}

-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = 1.f;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero
                                            collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        
        [_collectionView registerClass:[AdvertisementCollectionViewCell class]
            forCellWithReuseIdentifier:reusedAdvertisementCollectionViewCell];
        
        [_collectionView registerClass:[SecondCollectionViewCell class]
            forCellWithReuseIdentifier:reusedSecondCollectionViewCell];
    }
    
    return _collectionView;
}

-(NSMutableArray *)scrollViewArr
{
    if (!_scrollViewArr)
    {
        _scrollViewArr = [NSMutableArray array];
    }
    return _scrollViewArr;
}

-(NSMutableArray*)collectionViewArr
{
    
    if (!_collectionViewArr)
    {
        _collectionViewArr = [NSMutableArray array];
    }
    return _collectionViewArr;
}

-(void)loadDataAndRefresh
{
    
    self.scrollViewArr = @[ImageNamed(ig_second_scroll),ImageNamed(ig_second_scroll),ImageNamed(ig_second_scroll)].mutableCopy;
    self.collectionViewArr = @[ImageNamed(ig_second_icon),ImageNamed(ig_second_icon),ImageNamed(ig_second_icon),ImageNamed(ig_second_icon),ImageNamed(ig_second_icon),ImageNamed(ig_second_icon)].mutableCopy;
}
@end
