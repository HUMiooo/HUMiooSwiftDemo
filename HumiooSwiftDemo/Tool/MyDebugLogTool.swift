//
//  MyDebugLogTool.swift
//  AIJIAIJIAShopSwift
//
//  Created by 赵春生 on 2017/7/7.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit

class MyDebugLogTool: NSObject {
    static func Log<Y>(message: Y,file:String = #file, function:String = #function, line:Int = #line) {
        #if DEBUG
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        print("----📀\(fileName)📀💿第\(line)行💿----")
        print("📀\(function)📀\n💿\(message)💿")
        print("••••End••••")
        #endif
    }
}
