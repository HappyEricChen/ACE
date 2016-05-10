//
//  HomeViewController.m
//  star
//
//  Created by Eric Chen on 16/5/2.
//  Copyright © 2016年 Eric. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "PrefixHeader.pch"
#import "HomeModel.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,retain)NSMutableArray *dataArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationView];
    [self initTableView];
 
}

-(NSMutableArray *)dataArray {
    NSLog(@"哈哈哈");
    if (_dataArray.count == 0) {
        _dataArray = [[NSMutableArray alloc]init];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
        NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
        if (data.count != 0) {
            for (NSDictionary *dic in data) {
                HomeModel *model = [[HomeModel alloc]initWithDic:dic];
                [_dataArray addObject:model];
            }
        }
    }
    return  _dataArray;
}


-(void)initTableView {
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:self.myTableView];
}

-(void)setNavigationView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor colorWithWhite:0.3 alpha:1];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"明星周排行榜";
    self.navigationItem.titleView = label;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellStr = @"ShopCarCell";
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    
    if(!cell){
        
        cell = [[HomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    HomeModel *model = [self.dataArray objectAtIndex:indexPath.row];
    [cell passModel:model];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  80;
}
@end
