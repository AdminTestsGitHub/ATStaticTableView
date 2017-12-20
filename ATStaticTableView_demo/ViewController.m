//
//  ViewController.m
//  ATStaticTableView_demo
//
//  Created by AdminTest on 2017/12/19.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#import "ViewController.h"
#import "ATStaticTableViewHeader.h"
#import "TableViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    
    ATStaticTableViewCellData *d = [[ATStaticTableViewCellData alloc] init];
    d.identifier = 200;
    d.iconImage = [UIImage imageNamed:@"icon_grid_0"];
    d.title = @"主题";
    d.type = ATStaticTableViewCellTypeDisclosureIndicator;
    d.didSelectTarget = self;
    d.didSelectAction = @selector(selectAction:);
    
    ATStaticTableViewCellData *d1 = [[ATStaticTableViewCellData alloc] init];
    d1.identifier = 201;
    d1.iconImage = [UIImage imageNamed:@"icon_grid_1"];
    d1.title = @"主题1";
    d1.type = ATStaticTableViewCellTypeNone;
    d1.didSelectTarget = self;
    d1.didSelectAction = @selector(selectAction:);
    
    ATStaticTableViewCellData *d2 = [[ATStaticTableViewCellData alloc] init];
    d2.identifier = 202;
    d2.iconImage = [UIImage imageNamed:@"icon_grid_2"];
    d2.title = @"主题2";
    d2.type = ATStaticTableViewCellTypeCheckmark;
    d2.didSelectTarget = self;
    d2.didSelectAction = @selector(selectAction:);
    
    ATStaticTableViewCellData *d3 = [[ATStaticTableViewCellData alloc] init];
    d3.identifier = 203;
    d3.iconImage = [UIImage imageNamed:@"icon_grid_3"];
    d3.title = @"主题3";
    d3.type = ATStaticTableViewCellTypeDetailDisclosureButton;
    d3.didSelectTarget = self;
    d3.didSelectAction = @selector(selectAction:);
    
    ATStaticTableViewCellData *d4 = [[ATStaticTableViewCellData alloc] init];
    d4.identifier = 204;
//    d4.iconImage = [UIImage imageNamed:@"icon_grid_4];
    d4.title = @"主题4";
    d4.type = ATStaticTableViewCellTypeDetailButton;
    d4.didSelectTarget = self;
    d4.didSelectAction = @selector(selectAction:);
    
    ATStaticTableViewCellData *d5 = [[ATStaticTableViewCellData alloc] init];
    d5.identifier = 205;
    d5.iconImage = [UIImage imageNamed:@"icon_grid_5"];
    d5.title = @"UISwitch";
    d5.type = ATStaticTableViewCellTypeSwitch;
    d5.ValueObject = @YES;
    d5.Target = self;
    d5.Action = @selector(switchAction:);
    
    ATStaticTableViewCellData *d6 = [[ATStaticTableViewCellData alloc] init];
    d6.identifier = 206;
    d6.iconImage = [UIImage imageNamed:@"icon_grid_6"];
    d6.title = @"TextField";
    d6.type = ATStaticTableViewCellTypeTextField;
    
    ATStaticTableViewCellData *d7 = [[ATStaticTableViewCellData alloc] init];
    d7.identifier = 207;
    d7.iconImage = [UIImage imageNamed:@"icon_grid_7"];
    d7.title = @"CustomDisclosureIndicator";
    d7.type = ATStaticTableViewCellTypeCustomDisclosureIndicator;
    d7.didSelectTarget = self;
    d7.didSelectAction = @selector(selectAction:);
    
    NSArray *data = @[@[d],
                      @[d1,d2,d3],
                      @[d4],
                      @[d5, d6, d7]];
    
    
    ATStaticTableViewCellDataSource *dataSource = [[ATStaticTableViewCellDataSource alloc] initWithCellDataSections:data configuration:^(ATStaticTableViewCell *cell, ATStaticTableViewCellData *data) {
        if (data.type == ATStaticTableViewCellTypeTextField) {
            [cell configTextFieldCellWithCellData:data];
        } else if (data.type == ATStaticTableViewCellTypeSwitch) {
            [cell configSwitchCellWithCellData:data];
        } else if (data.type == ATStaticTableViewCellTypeCustomDisclosureIndicator) {
            
        }
    }];
    
    self.tableView.at_staticCellDataSource = dataSource;
    self.tableView.at_staticCellDelegate = self;
}

- (void)selectAction:(ATStaticTableViewCellData *)sender
{
    NSLog(@"%ld", sender.identifier);
    [self.navigationController pushViewController:[[TableViewController alloc] init] animated:YES];
}

- (void)switchAction:(UISwitch *)sender
{
    NSLog(@"%d", sender.isOn);
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView *view = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

            view;
        });
    }
    return _tableView;
}

@end
