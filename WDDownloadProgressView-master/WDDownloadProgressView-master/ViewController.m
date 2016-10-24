//
//  ViewController.m
//  WDDownloadProgressView-master
//
//  Created by WD on 16/10/23.
//  Copyright © 2016年 WD. All rights reserved.
//  Github:https://github.com/Cehae/WDDownloadProgressView-master
#import "ViewController.h"
#import "WDDownloadProgressView.h"

@interface ViewController ()
/**
 *  <#Description#>
 */
@property (nonatomic, strong) WDDownloadProgressView * progressView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _progressView= [[WDDownloadProgressView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_progressView];
    self.progressView.lineColor = [UIColor blueColor];
    self.progressView.lineWidth = 10;

}

- (IBAction)slider:(UISlider *)sender {
    //获取进度值
    NSLog(@"%f",sender.value);
    self.progressView.titleLabel.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    
    self.progressView.progressValue = sender.value;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
