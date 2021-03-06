//
//  HDAppListViewController.h
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDAppListItem.h"
#import "HDBannerItem.h"

typedef void(^AppListClickCompleteHandler)(NSInteger index,HDAppListItem *applistItem);
typedef void(^AppBannerClickCompleteHandler)(NSInteger index,HDBannerItem *bannerItem);

@interface HDAppListViewController : UIViewController
///在list设置的产品个数
@property (assign, nonatomic, readonly) NSInteger appListItemCount;
///在banner设置的产品个数
@property (assign, nonatomic, readonly) NSInteger appBannerItemCount;
///点击列表的list的回调
@property (copy, nonatomic) AppListClickCompleteHandler appListClickCompleteHandler;
///点击banner的回调
@property (copy, nonatomic) AppBannerClickCompleteHandler appBannerClickCompleteHandler;
///背景颜色
@property (strong, nonatomic) UIColor *listBackgroundColor;
///每个cell的背景色
@property (strong, nonatomic) UIColor *cellBackgroundColor;
///banner和list的间距，默认为20
@property (assign, nonatomic) float bannerDistance;
///icon图标的大小，默认为80
@property (assign, nonatomic) float iconImageWidth;
///标题颜色,默认为浅灰色
@property (strong, nonatomic) UIColor *titleColor;
///标题字体大小，默认为14
@property (assign, nonatomic) float titleFontSize;
///是否显示分割线,默认为YES
@property (assign, nonatomic) BOOL hasLine;
///分割线颜色,默认为浅灰色
@property (strong, nonatomic) UIColor *lineColor;
///分割线的宽度，默认为0.5
@property (assign, nonatomic) float lineWidth;
///没安装的显示文字颜色，默认为红色
@property (strong, nonatomic) UIColor *uninstallTitleColor;
///未安装的显示文字，默认为未安装
@property (copy, nonatomic) NSString * uninstallTipString;
///安装过的显示文字颜色，默认为绿色
@property (strong, nonatomic) UIColor *installTitleColor;
///安装过的显示文字，默认为已安装
@property (copy, nonatomic) NSString * installTipString;
///标题字体大小，默认为12
@property (assign,nonatomic) float installTitleFontSize;
///点击list是否自动跳转到下载页，默认为YES
@property (assign, nonatomic) BOOL autoDownload;

///在List钟增加项目，不显示安装状态
- (void)addAppListItem:(HDAppListItem *)applistItem;

///增加banner的图片
- (void)addBannerItem:(HDBannerItem *)bannerItem;
@end
