//
//  HDAppListCollectionViewCell.m
//  HDAppListViewController
//
//  Created by Damon on 2018/4/21.
//  Copyright © 2018年 Damon. All rights reserved.
//

#import "HDAppListCollectionViewCell.h"

@interface HDAppListCollectionViewCell()
@property (strong, nonatomic) UIImageView *m_imageView;
@property (strong, nonatomic) UILabel *m_titleLabel;
@property (strong, nonatomic) UIView *m_verticalLine;
@property (strong, nonatomic) UIView *m_horizontalLine;
@property (strong, nonatomic) UIView *m_topLine;
@property (strong, nonatomic) UILabel *m_schemeLabel;
@property (strong, nonatomic)HDAppListItem *m_appListItem;
@end


@implementation HDAppListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.m_imageView = [[UIImageView alloc] initWithFrame:frame];
        self.m_imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.m_imageView];
        
        self.m_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.m_imageView.frame.origin.y + _iconImageWidth, frame.size.width, frame.size.height - _iconImageWidth)];
        [self.m_titleLabel setTextColor:[UIColor lightGrayColor]];
        [self.m_titleLabel setFont:[UIFont systemFontOfSize:14]];
        self.m_titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.m_titleLabel];
        
        self.m_schemeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.m_imageView.frame.origin.y + _iconImageWidth, frame.size.width, frame.size.height - _iconImageWidth)];
        [self.m_schemeLabel setTextColor:[UIColor lightGrayColor]];
        [self.m_schemeLabel setFont:[UIFont systemFontOfSize:14]];
        self.m_schemeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.m_schemeLabel];
        
        self.m_verticalLine = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width - 0.5, 0, 0.5, frame.size.height)];
        [self.m_verticalLine setBackgroundColor:_lineColor];
        [self.contentView addSubview:self.m_verticalLine];
        
        self.m_horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5)];
        [self.m_horizontalLine setBackgroundColor:_lineColor];
        [self.contentView addSubview:self.m_horizontalLine];
        
        self.m_topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        [self.m_topLine setBackgroundColor:_lineColor];
        [self.contentView addSubview:self.m_topLine];
        
    }
    return self;
}

- (void)createUIWithItem:(HDAppListItem *)applistItem {
    _m_appListItem = applistItem;
    [self.m_imageView setImage:applistItem.appIconImg];
    [self.m_titleLabel setText:applistItem.appName];
    [self p_changeColor];
}

- (void)setLineWidth:(float)lineWidth {
    _lineWidth = lineWidth;
    CGRect topLineFrame = self.m_topLine.frame;
    CGRect verticalLineFrame = self.m_verticalLine.frame;
    CGRect horizontalLineFrame = self.m_horizontalLine.frame;
    
    [self.m_topLine setFrame:CGRectMake(topLineFrame.origin.x, topLineFrame.origin.y, topLineFrame.size.width, lineWidth)];
    [self.m_verticalLine setFrame:CGRectMake(verticalLineFrame.size.width - lineWidth, topLineFrame.origin.y, lineWidth, verticalLineFrame.size.height)];
    [self.m_horizontalLine setFrame:CGRectMake(horizontalLineFrame.origin.x, horizontalLineFrame.origin.y, horizontalLineFrame.size.width, lineWidth)];
    
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self.m_verticalLine setBackgroundColor:_lineColor];
    [self.m_horizontalLine setBackgroundColor:_lineColor];
    [self.m_topLine setBackgroundColor:_lineColor];
}

- (void)setHasLine:(BOOL)hasLine {
    _hasLine = hasLine;
    self.m_verticalLine.hidden = !hasLine;
    self.m_horizontalLine.hidden = !hasLine;
}

- (void)setHasTopLine:(BOOL)hasTopLine {
    _hasTopLine = hasTopLine;
    self.m_topLine.hidden = !hasTopLine;
}

- (void)setIconImageWidth:(float)iconImageWidth {
    _iconImageWidth = iconImageWidth;
    CGRect frame = self.m_imageView.frame;
    
    [self.m_imageView setFrame:CGRectMake((frame.size.width - iconImageWidth)/2, (frame.size.width - iconImageWidth)/2 - 20, _iconImageWidth, _iconImageWidth)];
    self.m_imageView.layer.cornerRadius = iconImageWidth/2.0;
    
    [self.m_titleLabel setFrame:CGRectMake(0, CGRectGetMaxY(self.m_imageView.frame), frame.size.width, 24)];
    
    [self.m_schemeLabel setFrame:CGRectMake(0, CGRectGetMaxY(self.m_titleLabel.frame), frame.size.width, frame.size.height - CGRectGetMaxY(self.m_titleLabel.frame))];
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    [self.m_titleLabel setTextColor:titleColor];
}

- (void)setTitleFontSize:(float)titleFontSize {
    _titleFontSize = titleFontSize;
    [self.m_titleLabel setFont:[UIFont systemFontOfSize:titleFontSize]];
}

- (void)setInstallTitleColor:(UIColor *)installTitleColor {
    _installTitleColor = installTitleColor;
    [self p_changeColor];
}

- (void)setUninstallTitleColor:(UIColor *)uninstallTitleColor {
    _uninstallTitleColor = uninstallTitleColor;
    [self p_changeColor];
}

- (void)setInstallTitleFontSize:(float)installTitleFontSize {
    _installTitleFontSize = installTitleFontSize;
    [self.m_schemeLabel setFont:[UIFont systemFontOfSize:installTitleFontSize]];
}

- (void)setInstallTipString:(NSString *)installTipString {
    _installTipString = installTipString;
    [self p_changeColor];
}

- (void)setUninstallTipString:(NSString *)uninstallTipString {
    _uninstallTipString = uninstallTipString;
    [self p_changeColor];
}

- (void)p_changeColor {
    if (_m_appListItem.appScheme.length > 0) {
        self.m_schemeLabel.hidden = NO;
        NSString *schemeStr = [NSString stringWithFormat:@"%@://",_m_appListItem.appScheme];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:schemeStr]]) {
            [self.m_schemeLabel setTextColor:_installTitleColor];
            [self.m_schemeLabel setText:_installTipString];
        } else {
            [self.m_schemeLabel setTextColor:_uninstallTitleColor];
            [self.m_schemeLabel setText:_uninstallTipString];
        }
    } else {
        self.m_schemeLabel.hidden = YES;
    }
}
@end
