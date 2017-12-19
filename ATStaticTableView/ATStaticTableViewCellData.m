//
//  ATStaticTableViewCellData.m
//  DPCA
//
//  Created by AdminTest on 2017/12/18.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#import "ATStaticTableViewCellData.h"

@implementation ATStaticTableViewCellData

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
}

+ (instancetype)staticTableViewCellDataWithIdentifier:(NSInteger)identifier
                                                image:(UIImage *)image
                                                 text:(NSString *)text
                                           detailText:(NSString *)detailText
                                      didSelectTarget:(id)didSelectTarget
                                      didSelectAction:(SEL)didSelectAction
                                        Type:(ATStaticTableViewCellType)Type {
    return [ATStaticTableViewCellData staticTableViewCellDataWithIdentifier:identifier
                                                                    cellClass:[UITableViewCell class]
                                                                       height:TableViewCellNormalHeight
                                                                        image:image
                                                                         text:text
                                                                   detailText:detailText
                                                              didSelectTarget:didSelectTarget
                                                              didSelectAction:didSelectAction
                                                                Type:Type
                                                         ValueObject:nil
                                                              Target:nil
                                                              Action:NULL];
}

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
                                      Action:(SEL)Action {
    ATStaticTableViewCellData *data = [[ATStaticTableViewCellData alloc] init];
    data.identifier = identifier;
    data.cellClass = cellClass;
    data.height = height;
    data.iconImage = image;
    data.title = text;
    data.subTitle = detailText;
    data.didSelectTarget = didSelectTarget;
    data.didSelectAction = didSelectAction;
    data.type = Type;
    data.ValueObject = ValueObject;
    data.Target = Target;
    data.Action = Action;
    return data;
}

- (instancetype)init {
    if (self = [super init]) {
        self.cellClass = [UITableViewCell class];
        self.height = TableViewCellNormalHeight;
    }
    return self;
}

- (void)setCellClass:(Class)cellClass {
    NSAssert([cellClass isSubclassOfClass:[UITableViewCell class]], @"%@.cellClass 必须为 ATTableViewCell 的子类", NSStringFromClass(self.class));
    _cellClass = cellClass;
}

+ (UITableViewCellAccessoryType)systemTableViewCellAccessoryTypeWithATStaticTableViewCellType:(ATStaticTableViewCellType)type {
    switch (type) {
        case ATStaticTableViewCellTypeDisclosureIndicator:
            return UITableViewCellAccessoryDisclosureIndicator;
        case ATStaticTableViewCellTypeDetailDisclosureButton:
            return UITableViewCellAccessoryDetailDisclosureButton;
        case ATStaticTableViewCellTypeCheckmark:
            return UITableViewCellAccessoryCheckmark;
        case ATStaticTableViewCellTypeDetailButton:
            return UITableViewCellAccessoryDetailButton;
        case ATStaticTableViewCellTypeSwitch:
        default:
            return UITableViewCellAccessoryNone;
    }
}


@end
