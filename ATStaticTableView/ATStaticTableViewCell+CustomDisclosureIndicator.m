//
//  ATStaticTableViewCell+CustomDisclosureIndicator.m
//  DPCA
//
//  Created by AdminTest on 2017/12/20.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#import "ATStaticTableViewCell+CustomDisclosureIndicator.h"

static CGFloat kTableViewCellSpacingBetweenAccessoryLeftViewAndDisclosureIndicator = 12;
static CGFloat kAccessoryTextFont = 13;

@implementation ATStaticTableViewCell (CustomDisclosureIndicator)

- (void)configCustomDisclosureIndicatorCellWithCellData:(ATStaticTableViewCellData *)data
{
    //强制添加 DisclosureIndicator ➡️
    [self.defaultAccessoryView addSubview:self.defaultAccessoryDisclosureIndicatorImageView];
    
    UIView *accessoryLeftView;
    
    if (data.accessoryText) {
        self.defaultAccessoryTitleLabel.text = data.accessoryText;
        self.defaultAccessoryTitleLabel.textColor = data.accessoryTextColor ? : [UIColor lightGrayColor];
        self.defaultAccessoryTitleLabel.font = [UIFont systemFontOfSize:data.accessoryTextFont ? : kAccessoryTextFont];
        
        [self.defaultAccessoryTitleLabel sizeToFit];
        [self.defaultAccessoryView addSubview:self.defaultAccessoryTitleLabel];
        accessoryLeftView = self.defaultAccessoryTitleLabel;
    }
    
    if (data.accessoryImage) {
        self.defaultAccessoryImageView.image = data.accessoryImage;
        self.defaultAccessoryImageView.frame = CGRectMake(0, 0, data.height - 20, data.height - 20);
        [self.defaultAccessoryView addSubview:self.defaultAccessoryImageView];
        accessoryLeftView = self.defaultAccessoryImageView;
    }
    
    self.defaultAccessoryView.frame = CGRectMake(0, 0, CGRectGetWidth(accessoryLeftView.frame) + 10 + CGRectGetWidth(self.defaultAccessoryDisclosureIndicatorImageView.frame), fmax(CGRectGetHeight(accessoryLeftView.frame), CGRectGetHeight(self.defaultAccessoryDisclosureIndicatorImageView.frame)));
    
    /*
    accessoryLeftView.frame 需要设置一下
    accessoryLeftView.frame = CGRectSetXY(accessoryLeftView.frame, 0, CGRectGetMinYVerticallyCenterInParentRect(self.defaultAccessoryView.frame, accessoryLeftView.frame));
     */
    
    /*
    accessoryLeftView.frame 需要设置一下
    self.defaultAccessoryDisclosureIndicatorImageView.frame = CGRectSetXY(self.defaultAccessoryDisclosureIndicatorImageView.frame, CGRectGetMaxX(accessoryLeftView.frame) + kTableViewCellSpacingBetweenAccessoryLeftViewAndDisclosureIndicator, CGRectGetMinYVerticallyCenterInParentRect(self.defaultAccessoryView.frame, self.defaultAccessoryDisclosureIndicatorImageView.frame));
    */
    self.accessoryView = self.defaultAccessoryView;
}

@end
