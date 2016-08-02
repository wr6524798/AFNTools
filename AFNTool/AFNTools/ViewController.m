//
//  ViewController.m
//  AFNTools
//
//  Created by wangrui on 16/8/2.
//  Copyright © 2016年 tools. All rights reserved.
//

#import "ViewController.h"
#import "XCNetworkTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

// get/post请求
-(void)getInfo{
    NSString *urlSting = @"";
    NSDictionary *parameters =@{};
    [[XCNetworkTools sharedTools] requestWithMethod:POST URLString:urlSting parameters:parameters finished:^(id result, NSError *error) {
        //成功和失败回调  可以根据code值进行判断
    } nonetwork:^{
        // 无网络
    }];
}

-(void)uploadData{
    NSData *data;
    NSString *urlSting = @"";
    NSDictionary *parameters =@{};
    [[XCNetworkTools sharedTools] uploadData:data URLString:urlSting name:@"" fileName:@"" parameters:parameters finish:^(id result, NSError *error) {
        //成功和失败回调  可以根据code值进行判断
    } nonetwork:^{
        // 无网络
    }];
}

// 文件下载
-(void)downloadFile{
    NSString *urlSting = @"";
    NSString *fileName = @"";
    [[XCNetworkTools sharedTools] downloadWithUrlString:urlSting fileName:fileName finish:^(id result, NSError *error) {
        //成功和失败回调  可以根据code值进行判断
    } nonetwork:^{
        // 无网络
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
