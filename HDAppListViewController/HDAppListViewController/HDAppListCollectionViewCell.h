//
//  HDAppListCollectionViewCell.h
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDAppListItem.h"

@interface HDAppListCollectionViewCell : UICollectionViewCell
///是否显示分割线
@property (assign, nonatomic) BOOL hasLine;
///是否显示头部的分割线
@property (assign, nonatomic) BOOL hasTopLine;
///分割线颜色,默认为浅灰色
@property (strong,nonatomic) UIColor *lineColor;
///分割线的宽度
@property (assign,nonatomic) float lineWidth;
///icon图标的大小，默认为80
@property (assign, nonatomic) float iconImageWidth;
///标题颜色,默认为浅灰色
@property (strong,nonatomic) UIColor *titleColor;
///标题字体大小，默认为14
@property (assign,nonatomic) float titleFontSize;
///标题字体大小，默认为14
@property (assign,nonatomic) float installTitleFontSize;
///没安装的显示文字颜色，默认为红色
@property (strong, nonatomic) UIColor *uninstallTitleColor;
///未安装的显示文字，默认为未安装
@property (copy, nonatomic) NSString * uninstallTipString;
///安装过的显示文字颜色，默认为绿色
@property (strong, nonatomic) UIColor *installTitleColor;
///安装过的显示文字，默认为已安装
@property (copy, nonatomic) NSString * installTipString;

- (void)createUIWithItem:(HDAppListItem *)applistItem;
@end
