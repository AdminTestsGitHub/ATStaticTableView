//
//  ATStaticTableViewCellData.h
//  DPCA
//
//  Created by AdminTest on 2017/12/18.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ATStaticTableViewCellType) {
    //系统自带样式
    ATStaticTableViewCellTypeNone,
    ATStaticTableViewCellTypeDisclosureIndicator,
    ATStaticTableViewCellTypeDetailDisclosureButton,
    ATStaticTableViewCellTypeCheckmark,
    ATStaticTableViewCellTypeDetailButton = 4,
    
    //拓展的
    ATStaticTableViewCellTypeCustomDisclosureIndicator,
    ATStaticTableViewCellTypeSwitch,
    ATStaticTableViewCellTypeTextField
};

/**
 *  一个 cellData 对象用于存储 static tableView（例如设置界面那种列表） 列表里的一行 cell 的基本信息，包括这个 cell 的 class、text、detailText等。
 *  @see ATStaticTableViewCellDataSource
 */
@interface ATStaticTableViewCellData : NSObject

/// 当前 cellData 的标志，一般同个 tableView 里的每个 cellData 都会拥有不相同的 identifier
@property(nonatomic, assign) NSInteger identifier;

/// 当前 cellData 所对应的 indexPath
@property(nonatomic, strong, readonly) NSIndexPath *indexPath;

/// cell 要使用的 class，默认为 ATTableViewCell，若要改为自定义 class，必须是 ATTableViewCell 的子类
@property(nonatomic, assign) Class cellClass;

/// cell 的高度，默认为 TableViewCellNormalHeight
@property(nonatomic, assign) CGFloat height;

/// cell 左边要显示的图片，将会被设置到 cell.iconImageView.image
@property(nonatomic, strong) UIImage *iconImage;
@property (nonatomic, assign) CGSize iconSize;

/// cell 的文字，将会被设置到 cell.titleLabel.text
@property(nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *titleColor;
@property (nonatomic, assign) CGFloat titleFont;

/// cell 的详细文字，将会被设置到 cell.subTitleLabel.text
@property(nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *subTitleColor;
@property (nonatomic, assign) CGFloat subTitleFont;

/// cell 右边要显示的图片，将会被设置到 cell.placeHolderImageView.image
@property(nonatomic, strong) UIImage *placeHolderImage;

/// cell 右边的文字，将会被设置到 cell.placeHolderTitleLabel.text
@property(nonatomic, copy) NSString *placeHolder;

/// customView
@property (nonatomic, strong) UIView *customView;

/// 当 cell 的点击事件被触发时，要由哪个对象来接收
@property(nonatomic, assign) id didSelectTarget;

/// 当 cell 的点击事件被触发时，要向 didSelectTarget 指针发送什么消息以响应事件
/// @warning 这个 selector 接收一个参数，这个参数也即当前的 ATStaticTableViewCellData 对象
@property(nonatomic, assign) SEL didSelectAction;

/// cell 类型
@property(nonatomic, assign) ATStaticTableViewCellType type;

/// 配合 Type 使用，不同的 Type 需要配合不同 class 的 ValueObject 使用。例如 ATStaticTableViewCellTypeSwitch 要求传 @YES 或 @NO 用于控制 UISwitch.on 属性。
/// @warning 目前也仅支持与 ATStaticTableViewCellTypeSwitch 搭配使用。
@property(nonatomic, strong) NSObject *ValueObject;

/// 当 Type 是某些带 UIControl 的控件时，可通过这两个属性来为 View 添加操作事件。
/// 目前支持的类型包括：ATStaticTableViewCellTypeDetailDisclosureButton、ATStaticTableViewCellTypeDetailButton、ATStaticTableViewCellTypeSwitch
/// @warning 这个 selector 接收一个参数，与 didSelectAction 一样，这个参数一般情况下也是当前的 ATStaticTableViewCellData 对象，仅在 Switch 时会传 UISwitch 控件的实例
@property(nonatomic, assign) id Target;
@property(nonatomic, assign) SEL Action;

/// 上割线 ： 默认隐藏
@property (nonatomic, assign) BOOL isTopLine;
@property (nonatomic, assign) CGFloat topLeftMargin;
@property (nonatomic, assign) CGFloat topRightMargin;
/// 下割线 ： 默认显示
@property (nonatomic, assign) BOOL       isHiddenBottomLine;
@property (nonatomic, assign) BOOL       isCustomLineLeft;
@property (nonatomic, assign) CGFloat    bottomLeftMargin;
@property (nonatomic, assign) CGFloat    bottomRightMargin;

+ (instancetype)staticTableViewCellDataWithIdentifier:(NSInteger)identifier
                                                image:(UIImage *)image
                                                 text:(NSString *)text
                                           detailText:(NSString *)detailText
                                      didSelectTarget:(id)didSelectTarget
                                      didSelectAction:(SEL)didSelectAction
                                        Type:(ATStaticTableViewCellType)Type;

+ (instancetype)staticTableViewCellDataWithIdentifier:(NSInteger)identifier
                                            cellClass:(Class)cellClass
                                               height:(CGFloat)height
                                                image:(UIImage *)image
                                                 text:(NSString *)text
                                           detailText:(NSString *)detailText
                                      didSelectTarget:(id)didSelectTarget
                                      didSelectAction:(SEL)didSelectAction
                                        Type:(ATStaticTableViewCellType)Type
                                 ValueObject:(NSObject *)ValueObject
                                      Target:(id)Target
                                      Action:(SEL)Action;

+ (UITableViewCellAccessoryType)systemTableViewCellAccessoryTypeWithATStaticTableViewCellType:(ATStaticTableViewCellType)type;

@end
