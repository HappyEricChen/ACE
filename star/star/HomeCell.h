//
//  HomeCell.h
//  star
//
//  Created by webxun-mac1 on 16/5/3.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeModel;
@interface HomeCell : UITableViewCell
@property(nonatomic,retain)HomeModel *model;
-(void)passModel:(HomeModel *)model;
@end
