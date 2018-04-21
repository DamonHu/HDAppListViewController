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
@end


@implementation HDAppListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.m_imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 80)/2, 5, 80, 80)];
        self.m_imageView.layer.masksToBounds = YES;
        self.m_imageView.layer.cornerRadius = 40;
        [self.contentView addSubview:self.m_imageView];
        
        self.m_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, frame.size.width, frame.size.height - 90)];
        [self.m_titleLabel setTextColor:[UIColor lightGrayColor]];
        [self.m_titleLabel setFont:[UIFont systemFontOfSize:14]];
        self.m_titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.m_titleLabel];
        
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
    [self.m_imageView setImage:applistItem.iconImg];
    [self.m_titleLabel setText:applistItem.appName];
    if (_hasLine) {
        self.m_verticalLine.hidden = NO;
        self.m_horizontalLine.hidden = NO;
        [self.m_verticalLine setBackgroundColor:_lineColor];
        [self.m_horizontalLine setBackgroundColor:_lineColor];
    } else {
        self.m_verticalLine.hidden = YES;
        self.m_horizontalLine.hidden = YES;
    }
    
    if (_hasTopLine) {
        self.m_topLine.hidden = NO;
        [self.m_topLine setBackgroundColor:_lineColor];
    } else {
        self.m_topLine.hidden = YES;
    }
}
@end
