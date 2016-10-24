//
//  WDDownloadProgressView.h
//  WDDownloadProgressView-master
//
//  Created by WD on 16/10/23.
//  Copyright © 2016年 WD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDDownloadProgressView : UIView
/** 当前的进度值 */
@property (nonatomic, assign) CGFloat progressValue;
/** 中间Label */
@property (nonatomic, strong) UILabel * titleLabel;
/*
 * 线宽，默认5
 */
@property (nonatomic, assign) CGFloat lineWidth;
/*
 * 线的颜色，默认为黑色
 */
@property (nonatomic, strong) UIColor  * lineColor;

@end
