//
//  HDBannerItem.h
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDBannerItem : NSObject
@property (strong, nonatomic, readonly)  NSURL *bannerImgURL;

- (instancetype)initWithBannerImgURL:(NSURL *)bannerImgURL;
@end
