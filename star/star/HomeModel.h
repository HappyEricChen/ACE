//
//  HomeModel.h
//  star
//
//  Created by webxun-mac1 on 16/5/3.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property(nonatomic,copy)NSString *rank;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *number;
@property(nonatomic,copy)NSString *headImage;
@property(nonatomic,copy)NSString *arrow;

-(HomeModel *)initWithDic:(NSDictionary *)dic ;
//-(NSDictionary *)passModel:(HomeModel *)model;
@end
