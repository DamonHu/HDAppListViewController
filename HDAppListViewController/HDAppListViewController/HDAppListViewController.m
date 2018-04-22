//
//  HDAppListViewController.m
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import "HDAppListViewController.h"
#import "HDAppListCollectionViewCell.h"
#import "LCBannerView.h"

static NSString *const HDAppListCollectionViewCellReuseIdentifier = @"HDAppListCollectionViewCellReuseIdentifier";

@interface HDAppListViewController () <UICollectionViewDelegate,UICollectionViewDataSource,LCBannerViewDelegate>
///已设置的产品个数
@property (assign, nonatomic, readwrite) NSInteger appCount;

@property (strong, nonatomic) NSMutableArray *m_appListItemArray;
@property (strong, nonatomic) NSMutableArray *m_appBannerItemArray;
@property (strong, nonatomic) NSDictionary<NSAttributedStringKey, id> *m_titleTextAttributes;
@end

@implementation HDAppListViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.m_appListItemArray = [NSMutableArray array];
        self.m_appBannerItemArray = [NSMutableArray array];
        self.autoDownload = YES;
        self.hasLine = YES;
        self.lineColor = [UIColor lightGrayColor];
        self.lineWidth = 0.5f;
        self.bannerDistance = 20.0f;
        self.iconImageWidth = 80.0f;
        self.titleColor = [UIColor lightGrayColor];
        self.titleFontSize = 14.0f;
    }
    return self;
}

///增加App项目
- (void)addAppListItem:(HDAppListItem *)applistItem {
    if (applistItem) {
        [self.m_appListItemArray addObject:applistItem];
    }
}

- (void)addBannerItem:(HDBannerItem *)bannerItem {
    if (bannerItem) {
        [self.m_appBannerItemArray addObject:bannerItem];
    }
}

- (NSInteger)appListItemCount {
    return _m_appListItemArray.count;
}

- (NSInteger)appBannerItemCount {
    return _m_appBannerItemArray.count;
}

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self p_createUI];
}

- (void)p_createUI {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    float height = 0;
    if (_m_appBannerItemArray.count > 0) {
        NSMutableArray *imageUrlArray = [NSMutableArray array];
        for (int i = 0; i<_m_appBannerItemArray.count; i++) {
            HDBannerItem *item = [_m_appBannerItemArray objectAtIndex:i];
            [imageUrlArray addObject:item.bannerImgURL];
            
        }
        LCBannerView *bannerView = [[LCBannerView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200.0f) delegate:self imageURLs:imageUrlArray placeholderImageName:@"" timeInterval:3.0f currentPageIndicatorTintColor:[UIColor orangeColor] pageIndicatorTintColor:[UIColor whiteColor]];
        [self.view addSubview:bannerView];
        height += 200;
    }
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(screenSize.width/3.0, screenSize.width/3.0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, height + self.bannerDistance, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - height - self.bannerDistance - 2) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = _listBackgroundColor;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[HDAppListCollectionViewCell class] forCellWithReuseIdentifier:HDAppListCollectionViewCellReuseIdentifier];
    [self.view addSubview:collectionView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HDAppListItem *applistItem = [_m_appListItemArray objectAtIndex:indexPath.item];
    if (_autoDownload && applistItem.appID.length > 0) {
        NSURL *downloadURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",applistItem.appID]];
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:downloadURL options:[NSDictionary dictionary] completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:downloadURL];
        }
    }
    if (_appListClickCompleteHandler) {
        _appListClickCompleteHandler(indexPath.item,applistItem);
    }
}


#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _m_appListItemArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HDAppListItem *applistItem = [_m_appListItemArray objectAtIndex:indexPath.item];
    HDAppListCollectionViewCell *applistCollectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:HDAppListCollectionViewCellReuseIdentifier forIndexPath:indexPath];
    applistCollectionViewCell.hasLine = _hasLine;
    if (indexPath.item < 3) {
        applistCollectionViewCell.hasTopLine = _hasLine;
    } else{
        applistCollectionViewCell.hasTopLine = NO;
    }
    applistCollectionViewCell.iconImageWidth = _iconImageWidth;
    applistCollectionViewCell.lineColor = _lineColor;
    applistCollectionViewCell.lineWidth = _lineWidth;
    applistCollectionViewCell.titleColor = _titleColor;
    applistCollectionViewCell.titleFontSize = _titleFontSize;
    applistCollectionViewCell.contentView.backgroundColor = _cellBackgroundColor;
    [applistCollectionViewCell createUIWithItem:applistItem];
    return applistCollectionViewCell;
}


#pragma mark -
#pragma mark - LCBannerViewDelegate
- (void)bannerView:(LCBannerView *)bannerView didClickedImageIndex:(NSInteger)index {
    HDBannerItem *appBannerItem = [_m_appBannerItemArray objectAtIndex:index];
    if (_appBannerClickCompleteHandler) {
        _appBannerClickCompleteHandler(index,appBannerItem);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
