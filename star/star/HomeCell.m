//
//  HomeCell.m
//  star
//
//  Created by webxun-mac1 on 16/5/3.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "HomeCell.h"
#import "HomeModel.h"
@interface HomeCell()
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UIImageView *arrowImage;
@property(nonatomic,strong)UIButton *rankButton;
@end
@implementation HomeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.99 alpha:1];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
 
        [self setSubView];
        
    }
    return self;
}

-(void)setSubView{
//    self.rankButton = [UIButton alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

-(void)passModel:(HomeModel *)model {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
