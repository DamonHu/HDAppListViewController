//
//  ViewController.m
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import "ViewController.h"
#import "HDAppListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    button.tag = 1;
    [button setTitle:@"跳转进入列表" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(jumpToApplistVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 240, 200, 100)];
    button2.tag = 2;
    [button2 setTitle:@"push进入列表" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    [button2 addTarget:self action:@selector(jumpToApplistVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)jumpToApplistVC:(UIButton *)btn {
    //不显示导航栏
    HDAppListViewController *applistVC = [[HDAppListViewController alloc] init];
    [applistVC setListBackgroundColor:[UIColor lightGrayColor]];
    [applistVC setCellBackgroundColor:[UIColor whiteColor]];
    [applistVC setHasLine:YES];
    
    ///list
    HDAppListItem *item = [[HDAppListItem alloc] initWithAppID:@"1354861951" withAppName:@"懒猪计划" withAppIcon:[UIImage imageNamed:@"lanzhu"]];
    
    HDAppListItem *item2 = [[HDAppListItem alloc] initWithAppID:@"1193575039" withAppName:@"蚂蚁工具箱" withAppIcon:[UIImage imageNamed:@"huaimayitool"]];
    
    HDAppListItem *item3 = [[HDAppListItem alloc] initWithAppID:@"1178541464" withAppName:@"坏蚂蚁密码本" withAppIcon:[UIImage imageNamed:@"huaimayiwordbook"]];
   
    HDAppListItem *item4 = [[HDAppListItem alloc] initWithAppID:@"1178568612" withAppName:@"坏蚂蚁论坛" withAppIcon:[UIImage imageNamed:@"huaimayibbs"]];
    
    HDAppListItem *item5 = [[HDAppListItem alloc] initWithAppID:@"1178561172" withAppName:@"懒猪社区" withAppIcon:[UIImage imageNamed:@"lanzhushequ"]];
    
    HDAppListItem *item6 = [[HDAppListItem alloc] initWithAppID:@"1195751600" withAppName:@"密码本本地版" withAppIcon:[UIImage imageNamed:@"huaimayilocal"]];
    
    HDAppListItem *item7 = [[HDAppListItem alloc] initWithAppID:@"1178552578" withAppName:@"小屏密码本" withAppIcon:[UIImage imageNamed:@"huaimayimini"]];
    
    HDAppListItem *item8 = [[HDAppListItem alloc] initWithAppID:@"1342110359" withAppName:@"胡东东博客" withAppIcon:[UIImage imageNamed:@"hudongdong"]];
    
    [applistVC addAppListItem:item];
    [applistVC addAppListItem:item2];
    [applistVC addAppListItem:item3];
    [applistVC addAppListItem:item4];
    [applistVC addAppListItem:item5];
    [applistVC addAppListItem:item6];
    [applistVC addAppListItem:item7];
    [applistVC addAppListItem:item8];
    [applistVC addAppListItem:item];
    [applistVC addAppListItem:item2];
    [applistVC addAppListItem:item3];
    [applistVC addAppListItem:item4];
    
    ///banner图片
    NSURL *fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"git" ofType:@"png"]];
    HDBannerItem *bannerItem = [[HDBannerItem alloc] initWithBannerImgURL:fileURL];
    [applistVC addBannerItem:bannerItem];
    
    NSURL *fileURL2 = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"]];
    HDBannerItem *bannerItem2 = [[HDBannerItem alloc] initWithBannerImgURL:fileURL2];
    [applistVC addBannerItem:bannerItem2];
    
    //网络图片
    NSURL *url3 = [NSURL URLWithString:@"https://imgsrc.baidu.com/imgad/pic/item/eaf81a4c510fd9f900630df72f2dd42a2834a43c.jpg"];
    HDBannerItem *bannerItem3 = [[HDBannerItem alloc] initWithBannerImgURL:url3];
    [applistVC addBannerItem:bannerItem3];
    
    __weak typeof(applistVC) weakApplistVC = applistVC;
    applistVC.appListClickCompleteHandler = ^(NSInteger index, HDAppListItem *applistItem) {
        NSLog(@"点击了列表页");
        if (applistItem.appID.length == 0) {
            [weakApplistVC dismissViewControllerAnimated:YES completion:nil];
        }
    };
    
    applistVC.appBannerClickCompleteHandler = ^(NSInteger index, HDBannerItem *bannerItem) {
        NSLog(@"点击了banner");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.lazypig.net"]];
    };
    
    if (btn.tag == 1) {
        HDAppListItem *item5 = [[HDAppListItem alloc] initWithAppID:@"" withAppName:@"退出" withAppIcon:[UIImage imageNamed:@"exit"]];
        [applistVC addAppListItem:item5];
        [self presentViewController:applistVC animated:YES completion:nil];
    } else {
        [self.navigationController pushViewController:applistVC animated:YES];
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
