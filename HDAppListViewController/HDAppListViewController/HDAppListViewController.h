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
///是否显示分割线,默认为YES
@property (assign, nonatomic) BOOL hasLine;
///分割线颜色,默认为浅灰色
@property (strong,nonatomic) UIColor *lineColor;
///点击list是否自动跳转到下载页，默认为YES
@property (assign, nonatomic) BOOL autoDownload;

///在List钟增加项目
- (void)addAppListItem:(HDAppListItem *)applistItem;

///增加banner的图片
- (void)addBannerItem:(HDBannerItem *)bannerItem;
@end
