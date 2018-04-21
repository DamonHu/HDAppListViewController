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

- (void)createUIWithItem:(HDAppListItem *)applistItem;
@end
