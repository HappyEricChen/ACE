//
//  SecondViewController.m
//  star
//
//  Created by Eric Chen on 16/5/9.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondDataViewController.h"
#import "AdvertisementCollectionViewCell.h"
#import "SecondCollectionViewCell.h"
@interface SecondViewController ()<CustomNavigationViewDelegate,AdvertisementCollectionViewCellDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) SecondDataViewController* secondDataViewController;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondDataViewController = [[SecondDataViewController alloc]init];
    [self configureNavigationView];
    [self configureCollectionView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.secondDataViewController loadDataAndRefresh];
}

#pragma mark basic layout
-(void)configureNavigationView
{
    self.secondDataViewController.navigationView.delegate = self;
    [self.view addSubview:self.secondDataViewController.navigationView];
    
    self.secondDataViewController.navigationView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .heightIs(NavigationViewBasicHeight);
    
    
}
/**
 *  configure CollectionView
 */
-(void)configureCollectionView
{
    [self.view addSubview:self.secondDataViewController.collectionView];
    self.secondDataViewController.collectionView.delegate = self;
    self.secondDataViewController.collectionView.dataSource = self;
    
    self.secondDataViewController.collectionView.sd_layout
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.secondDataViewController.navigationView,0);
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.secondDataViewController.scrollViewArr.count>0?1:0;
    }
    else if (section == 1)
    {
        return self.secondDataViewController.collectionViewArr.count>0?self.secondDataViewController.collectionViewArr.count:0;
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCollectionViewCell* cell = nil;
    id object = nil;
    if (indexPath.section == 0)
    {
        AdvertisementCollectionViewCell* advertisementCollectionViewCell = [AdvertisementCollectionViewCell collectionView:collectionView
                                                                                                              forIndexPath:indexPath];
        advertisementCollectionViewCell.delegate = self;
        object = self.secondDataViewController.scrollViewArr;
        cell = advertisementCollectionViewCell;
        
    }
    else if (indexPath.section == 1)
    {
       SecondCollectionViewCell * secondCollectionViewCell = [SecondCollectionViewCell secondCollectionView:collectionView
                                                                                               forIndexPath:indexPath];
        object = self.secondDataViewController.collectionViewArr[indexPath.row];
        cell = secondCollectionViewCell;
    }
    
    [cell layoutWithObject:object];
    return cell;
}
#pragma mark - UICollectionViewFlowLayoutDelegate
-(UIEdgeInsets)collectionView:(UICollectionView*)collectionView
                       layout:(nonnull UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(CGSize)collectionView:(UICollectionView*)collectionView
                 layout:(nonnull UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(ScreenWidth, (ScreenHeight*2./5));
    }
    else if (indexPath.section == 1)
    {
        return CGSizeMake(ScreenWidth, 100);
    }
    return CGSizeZero;
}

#pragma mark -UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
//        ShoppingModel *shoppingModel = self.shoppingDataViewController.normalArr[indexPath.row];
//        WebViewViewController* webViewController = [[WebViewViewController alloc]init];
//        [webViewController generateParamsWithWebUrlPath:shoppingModel.url
//                                          withWebSource:t_shopping
//                                             withItemId:shoppingModel.idNum
//                                          withItemPrice:shoppingModel.price
//                                            withSendLog:YES
//                                         withShareImage:nil
//                                           withIdNumber:nil];
//        [webViewController createLogParamsWithSourceType:t_shopping
//                                         withSourceValue:t_defaultValue
//                                          withObjectType:t_webview
//                                         withObjectValue:t_defaultValue
//                                              withAction:nil];
//        [self.navigationController pushViewController:webViewController
//                                             animated:YES];
    }
}

#pragma mark - DiscoverAdvertisementCellDelegate
-(void)advertisementCell:(AdvertisementCollectionViewCell *)advertisementCollectionViewCell didSelecetedAtIndex:(NSUInteger)index
{
//    ShoppingModel *shoppingModel = self.shoppingDataViewController.saleArr[index];
//    WebViewViewController* webViewController = [[WebViewViewController alloc]init];
//    [webViewController generateParamsWithWebUrlPath:shoppingModel.url
//                                      withWebSource:t_shopping
//                                         withItemId:shoppingModel.idNum
//                                      withItemPrice:shoppingModel.price
//                                        withSendLog:YES
//                                     withShareImage:nil
//                                       withIdNumber:nil];
//    [webViewController createLogParamsWithSourceType:t_shopping
//                                     withSourceValue:t_defaultValue
//                                      withObjectType:t_webview
//                                     withObjectValue:t_defaultValue
//                                          withAction:nil];
//    [self.navigationController pushViewController:webViewController
//                                         animated:YES];
}


@end
