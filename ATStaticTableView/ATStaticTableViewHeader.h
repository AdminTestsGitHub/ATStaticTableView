//
//  ATStaticTableViewHeader.h
//  DPCA
//
//  Created by AdminTest on 2017/12/18.
//  Copyright © 2017年 AdminTest. All rights reserved.
//

#ifndef ATStaticTableViewHeader_h
#define ATStaticTableViewHeader_h

#define BeginIgnoreClangWarning(warningName) _Pragma("clang diagnostic push") _Pragma(ClangWarningConcat(#warningName))
#define EndIgnoreClangWarning _Pragma("clang diagnostic pop")

#define BeginIgnorePerformSelectorLeaksWarning BeginIgnoreClangWarning(-Warc-performSelector-leaks)
#define EndIgnorePerformSelectorLeaksWarning EndIgnoreClangWarning

#define BeginIgnoreAvailabilityWarning BeginIgnoreClangWarning(-Wpartial-availability)
#define EndIgnoreAvailabilityWarning EndIgnoreClangWarning

#define BeginIgnoreDeprecatedWarning BeginIgnoreClangWarning(-Wdeprecated-declarations)
#define EndIgnoreDeprecatedWarning EndIgnoreClangWarning

#import "UITableView+ATStaticCell.h"
#import "ATStaticTableViewCellDataSource.h"
#import "ATStaticTableViewCellData.h"
#import "ATStaticTableViewCell.h"
#import "ATStaticTableViewCell+TextField.h"
#import "ATStaticTableViewCell+Switch.h"
#import "ATStaticTableViewCell+CustomDisclosureIndicator.h"
#import "ATStaticTableViewCell+CustomAccessoryView.h"


#endif /* ATStaticTableViewHeader_h */
