//
//  WRNetworkTools.swift
//  ThinkSwift
//
//  Created by wangrui on 16/8/19.
//  Copyright © 2016年 tools. All rights reserved.
//

import UIKit
import AFNetworking

class WRNetworkTools: AFHTTPSessionManager {

    typealias WRRequestCallBack = (response:AnyObject?,error:NSError?) ->()
    
    enum XCRequestMethod {
        case POST
        case GET
    }

    // 单例
    static let shareManage : WRNetworkTools = {
        let baseUrl = NSURL(string: "");
        let manager = WRNetworkTools(baseURL: baseUrl, sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration());
        manager.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json","text/json","text/javascript","text/plain","text/html") as? Set<String>;
        return manager;
    }();
    
    func requestWithMethod(method:XCRequestMethod = .GET,urlString:String,paramerters:AnyObject?, finished:WRRequestCallBack) {
        let success = {(dataTask:NSURLSessionDataTask,responseObject:AnyObject?) -> Void in
            finished(response: responseObject,error: nil);
        }
        
        let failure = {(dataTask:NSURLSessionDataTask?,error:NSError) -> Void in
            finished(response: nil,error: error);
        }
        
        if method == .GET {
            GET(urlString, parameters: paramerters, progress:nil, success: success, failure: failure);
        }else {
            POST(urlString, parameters: paramerters, progress:nil, success: success, failure: failure);
        }
    }
    
    func requestWithData(data:NSData,name:String,urlString:String,parameters:AnyObject?,finished:WRRequestCallBack) {
        let success = {(dataTask:NSURLSessionDataTask,responseObject:AnyObject?) -> Void in
            finished(response:responseObject,error:nil);
        }
        
        let failure = {(dataTask:NSURLSessionDataTask?,error:NSError) -> Void in
            finished(response: nil,error: error);
        }
        
        POST(urlString, parameters: parameters, constructingBodyWithBlock: { (formData) -> Void in
            formData.appendPartWithFileData(data, name: name, fileName: "aa", mimeType: "application/octet-stream")
            }, progress: nil, success: success, failure: failure)
    }
}
