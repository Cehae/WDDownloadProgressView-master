//
//  WDDownloadProgressView.m
//  WDDownloadProgressView-master
//
//  Created by WD on 16/10/23.
//  Copyright © 2016年 WD. All rights reserved.
//  Github:https://github.com/Cehae/WDDownloadProgressView-master
#import "WDDownloadProgressView.h"
@interface WDDownloadProgressView ()<CAAnimationDelegate>

@end
@implementation WDDownloadProgressView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor grayColor];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.text = @"0.00%";
        [self addSubview:self.titleLabel];

        self.lineWidth = 5;
        self.lineColor = [UIColor blackColor];
        
    }
    return self;
}

-(void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    
    [self setNeedsDisplay];
    
    if (progressValue >= 1.0) {
        [self startAnimation];
}
}
-(void)startAnimation
{
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI);
    
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"transform.scale";
    anim2.toValue = @0.3;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.animations = @[anim,anim2];
    group.repeatCount = 1;
    group.removedOnCompletion = YES;
    group.fillMode = kCAFillModeForwards;
    [self.titleLabel.layer addAnimation:group forKey:nil];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.titleLabel.text = @"下载完成";
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    //画弧
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2;
    CGFloat angle =  self.progressValue *  M_PI * 2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    //3.把路径添加到上下文当中
    CGContextAddPath(ctx, path.CGPath);
    
    
    CGContextSetLineWidth(ctx, self.lineWidth);
    
    [self.lineColor set];
    
    //4.把上下文的内容渲染到View的layer上.
    CGContextStrokePath(ctx);
    
}


@end
