//
//  HomeCell.m
//  star
//
//  Created by webxun-mac1 on 16/5/3.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "HomeCell.h"
#import "PrefixHeader.pch"
#import "HomeModel.h"

@interface HomeCell()
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UIImageView *arrowImage;
@property(nonatomic,strong)UIButton *rankButton;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *numberLabel;
@end
@implementation HomeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
 
        [self setSubView];
        
    }
    return self;
}

-(void)setSubView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, 80)];
    view.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:view];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 79, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [UIColor colorWithWhite:0.91 alpha:1];
    [view addSubview:lineView];
    
    
    _rankButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 20, 20)];
    _rankButton.layer.cornerRadius = 5;
    [_rankButton setTitleColor:[UIColor colorWithWhite:0.2 alpha:1] forState:UIControlStateNormal];
    _rankButton.titleLabel.font = [UIFont systemFontOfSize:12];
    _rankButton.backgroundColor = [UIColor clearColor];
    _rankButton.layer.masksToBounds = YES;
    [view addSubview:_rankButton];
    
    
    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(40, 10, 60, 60)];
    //_headImage.image = [UIImage imageNamed:@"first"];
    _headImage.layer.cornerRadius = 30;
    _headImage.layer.masksToBounds = YES;
    [view addSubview:_headImage];
    
    
    _arrowImage =[[UIImageView alloc]initWithFrame:CGRectMake(10, 45, 25, 20)];
   // _arrowImage.image = [UIImage imageNamed:@"up"];
    [view addSubview:_arrowImage];
    
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40+60+10, 15, 100, 25)];
    _nameLabel.textColor = [UIColor colorWithWhite:0.2 alpha:1];
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.text = @"林志玲";
    [view addSubview:_nameLabel];

    
    
    UIImageView *flowerImage = [[UIImageView alloc]initWithFrame:CGRectMake(40+60+5, 40, 20, 20)];
    flowerImage.image = [UIImage imageNamed:@"flow"];
    [view addSubview:flowerImage];
    
    
    _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(40+60+5+20, 40,200, 20)];
    _numberLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    _numberLabel.font = [UIFont systemFontOfSize:14];
    //_numberLabel.text = @"932728";
    [view addSubview:_numberLabel];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-50, 25, 40, 30)];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitle:@"送花" forState:UIControlStateNormal];
    [view addSubview:btn];
     btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 1;
    [btn addTarget:self action:@selector(giveFlower:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor orangeColor].CGColor;
}

-(void)giveFlower:(UIButton *)sender {
    NSLog(@"%@",_model.name);
}


-(void)passModel:(HomeModel *)model {
    _model = model;
    switch ([model.rank intValue]) {
        case 1:
            [_rankButton setBackgroundImage:[UIImage imageNamed:@"levelicon_f"] forState:UIControlStateNormal];
            [_rankButton setTitle:@"" forState:UIControlStateNormal];
            break;
        case 2:
            [_rankButton setBackgroundImage:[UIImage imageNamed:@"levelicon_s"] forState:UIControlStateNormal];
            [_rankButton setTitle:@"" forState:UIControlStateNormal];
            break;
        case 3:
            [_rankButton setBackgroundImage:[UIImage imageNamed:@"levelicon_t"] forState:UIControlStateNormal];
            [_rankButton setTitle:@"" forState:UIControlStateNormal];
            break;
            
        default:
            [_rankButton setTitle:model.rank forState:UIControlStateNormal];
            [_rankButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            _rankButton.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
            break;
    }
    _headImage.image = [UIImage imageNamed:model.headImage];
    switch ([model.arrow intValue]) {
        case 0:
            _arrowImage.image = [UIImage imageNamed:@"horizontal"];
            break;
        case 1:
            _arrowImage.image = [UIImage imageNamed:@"up"];
            break;
        case -1:
            _arrowImage.image = [UIImage imageNamed:@"down"];
            break;
            
        default:
            break;
    }
    _nameLabel.text = model.name;
    _numberLabel.text = model.number;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
