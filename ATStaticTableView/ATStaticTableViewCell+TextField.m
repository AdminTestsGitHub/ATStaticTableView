//
//  ATStaticTableViewCell+TextField.m
//  DPCA
//
//  Created by AdminTest on 2017/12/18.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#import "ATStaticTableViewCell+TextField.h"

@implementation ATStaticTableViewCell (TextField)

- (void)configTextFieldCellWithCellData:(ATStaticTableViewCellData *)data;
{
    self.textField.size = CGSizeMake(200, 30);
    self.accessoryView = self.textField;
}

@end
