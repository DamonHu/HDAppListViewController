//
//  HDBannerItem.m
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import "HDBannerItem.h"

@interface HDBannerItem()
@property (strong, nonatomic, readwrite) NSURL *bannerImgURL;
@end

@implementation HDBannerItem

- (instancetype)init {
    return nil;
}

- (instancetype)initWithBannerImgURL:(NSURL *)bannerImgURL; {
    self = [super init];
    if (self) {
        self.bannerImgURL = bannerImgURL;
    }
    return self;
}

@end
