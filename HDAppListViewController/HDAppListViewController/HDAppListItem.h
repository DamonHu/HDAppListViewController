//
//  HDAppListItem.h
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HDAppListItem : NSObject
@property (copy, nonatomic, readonly) NSString *appID;
@property (copy, nonatomic, readonly) NSString *appName;
@property (strong, nonatomic, readonly) UIImage *appIconImg;
@property (copy, nonatomic, readonly) NSString *appScheme;

///创建App项目
- (instancetype)initWithAppID:(NSString *)appID withAppName:(NSString *)appName withAppIcon:(UIImage *)iconImg;

//创建App项目，设置对应的scheme，并且在info中设置LSApplicationQueriesSchemes可以检测打开状态
- (instancetype)initWithAppID:(NSString *)appID withAppName:(NSString *)appName withAppIcon:(UIImage *)iconImg withScheme:(NSString *)scheme;

@end
