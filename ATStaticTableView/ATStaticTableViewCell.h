//
//  ATStaticTableViewCell.h
//  DPCA
//
//  Created by AdminTest on 2017/12/18.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATStaticTableViewCellData.h"

@interface ATStaticTableViewCell : UITableViewCell

@property (nonatomic, strong) ATStaticTableViewCellData *data;

@property (nonatomic, strong) UIImageView *iconImageView;               //左侧的ImageView
@property (nonatomic, strong) UILabel *titleLabel;                      //左侧的Label
@property (nonatomic, strong) UILabel *subTitleLabel;                   //左侧subLabel

@property (nonatomic, strong) UIImageView *indicatorArrow;              //右侧的箭头
@property (nonatomic, strong) UIImageView *placeHolderImageView;        //右侧的箭头的左边的imageview
@property (nonatomic, strong) UILabel *placeHolderTitleLabel;           //右侧的箭头的左边的Label
@property (nonatomic, strong) UISwitch *indicatorSwitch;                //右侧的开关
@property (nonatomic, strong) UITextField *textField;                   //右侧输入框
@property (nonatomic, strong) UIView *customView;                       //自定义view

@property (nonatomic, strong) UIView *topLine;                          //上割线
@property (nonatomic, strong) UIView *bottomLine;                       //下割线

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
