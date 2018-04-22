//
//  HDAppListItem.m
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import "HDAppListItem.h"

@interface HDAppListItem()
@property (copy, nonatomic, readwrite) NSString *appID;
@property (copy, nonatomic, readwrite) NSString *appName;
@property (strong, nonatomic, readwrite) UIImage *appIconImg;
@property (copy, nonatomic, readwrite) NSString *appScheme;
@end

@implementation HDAppListItem

- (instancetype)init {
    return nil;
}

///创建App项目
- (instancetype)initWithAppID:(NSString *)appID withAppName:(NSString *)appName withAppIcon:(UIImage *)iconImg {
    return [self initWithAppID:appID withAppName:appName withAppIcon:iconImg withScheme:@""];
}

- (instancetype)initWithAppID:(NSString *)appID withAppName:(NSString *)appName withAppIcon:(UIImage *)iconImg withScheme:(NSString *)scheme {
    self = [super init];
    if (self) {
        self.appID = appID;
        self.appName = appName;
        self.appIconImg = iconImg;
        self.appScheme = scheme;
    }
    return self;
}
@end
