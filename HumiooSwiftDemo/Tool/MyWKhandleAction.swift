//
//  MyWKhandleAction.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2017/6/27.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit
//MARK:-UIColor
extension UIViewController {
    class func MyWKhandleAction(_ URL:URL)->UIViewController {
        let URLHost = URL.host
        let vc = UIViewController()
        let URLAbsoluteStr = URL.absoluteString.removingPercentEncoding
        if URLHost == "api.xxxx.com" {
            //搜索页
            if (URLAbsoluteStr?.contains("keyword="))! {
                
            }
            //品牌搜索页
            if (URLAbsoluteStr?.contains("brandid="))! {
                
            }
            //结算页
            if (URLAbsoluteStr?.contains("balance="))! {
                
            }
            //客服
            if (URLAbsoluteStr?.contains("CustomerService"))! {
                
            }
            //网页
            if (URLAbsoluteStr?.contains("weblink="))! {
//                let webLinkStr = "weblink="
//                let webLinkArr = URLAbsoluteStr?.components(separatedBy: webLinkStr)
//
//                let webTitleStr = "webTitle="
//                let webTitleArr = webLinkArr?[1].components(separatedBy: webTitleStr)
//
//                let GetWebTitleStr = webTitleArr?.first
//                let GetNavTitleStr = webTitleArr?.last
//
//                let webvc = MyBaseWebViewController()
//                webvc.urlStr = GetWebTitleStr! as NSString
//                webvc.navTitle = GetNavTitleStr! as NSString
                
//                return webvc
            }
            //跳转附近门店
            if (URLAbsoluteStr?.contains("nearshop=1"))! {
                
            }else if (URLAbsoluteStr?.contains("nearshop=2"))! {
                
            }else if (URLAbsoluteStr?.contains("nearshopping"))! {
                
            }
            //需要登录
            if (URLAbsoluteStr?.contains("api_login"))! {
                
            }
        }
        vc.view.backgroundColor = UIColor.white
        return vc
    }
}
