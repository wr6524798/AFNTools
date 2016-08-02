//
//  XCNetworkTools.h
//  
//
//  Created by 王锐 on 16/3/30.
//  Copyright © 2016年 eCar. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ApiConfig.h"

typedef enum : NSUInteger {
    GET,
    POST,
} XCRequestMethod;

/**
 *  @brief 当前网络的状态
 */
typedef void (^XCReachability)();

/**
 *  @brief 网络请求回调类型
 *
 *  @param result 返回结果
 *  @param error  错误信息
 */
typedef void (^XCRequestCallBack)(id result,NSError *error);

@interface XCNetworkTools : AFHTTPSessionManager

/**
 *  @brief 网络工具单例
 */
+(instancetype)sharedTools;

/**
 *  @brief 发起网络请求
 *
 *  @param method     GET/POST
 *  @param URLString  请求地址
 *  @param parameters 请求参数
 *  @param finish     请求完成回调
 */
-(void)requestWithMethod:(XCRequestMethod)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters finished:(XCRequestCallBack)finish nonetwork:(XCReachability)nonetwork;

/**
 *  @brief 上传二进制数据
 *
 *  @param data       需要上传的二进制数据
 *  @param URLString  URLString
 *  @param name       服务器存放文件夹名称
 *  @param fileName   服务器存放文件夹中文件名称
 *  @param parameters 请求参数字典
 *  @param finish     完成回调
 */
-(void)uploadData:(NSData *)data URLString:(NSString *)URLString name:(NSString *)name fileName:(NSString *)fileName parameters:(NSDictionary *)parameters finish:(XCRequestCallBack)finish nonetwork:(XCReachability)nonetwork;

/**
 *  @brief 下载文件
 *
 *  @param URLString  文件地址
 *  @param fileName  文件名称(暂时未使用)
 *  @param finish    完成回调
 *  @param nonetwork 网络状态
 */
-(void)downloadWithUrlString:(NSString *)URLString fileName:(NSString *)fileName finish:(XCRequestCallBack)finish nonetwork:(XCReachability)nonetwork;

@end
