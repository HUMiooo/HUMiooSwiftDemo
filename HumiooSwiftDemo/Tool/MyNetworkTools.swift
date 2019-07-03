//
//  MyNetworkTools.swift
//  AIJIAIJIAShopSwift
//
//  Created by 赵春生 on 2017/7/3.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit
import Alamofire
enum MethodType {
    case get
    case post
}
class MyNetworkTools: NSObject {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        // 获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters, encoding: URLEncoding.init(destination: .queryString), headers: nil).responseJSON { (response) in
            // 获取结果
            guard let result = response.result.value else {
                print( response.result.error!)
                return
            }
            // 将结果回调出去
            finishedCallback(result)
        }
    }
}

