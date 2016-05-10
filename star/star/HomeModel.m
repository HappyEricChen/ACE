//
//  HomeModel.m
//  star
//
//  Created by webxun-mac1 on 16/5/3.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

-(HomeModel *)initWithDic:(NSDictionary *)dic {
    self=[super init];
    if (self) {
        self.rank=[dic objectForKey:@"rank"];
        self.name=[dic objectForKey:@"name"];
        self.number=[dic objectForKey:@"number"];
        self.headImage=[dic objectForKey:@"headImage"];
        self.arrow=[dic objectForKey:@"arrow"];
    }
    return self;
}
@end
