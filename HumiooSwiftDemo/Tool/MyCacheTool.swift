//
//  MyCacheTool.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2017/7/4.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit

class MyCacheTool: NSObject {
    // 计算缓存大小
    static var cacheSize: String{
        get{
            let basePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
            let fileManager = FileManager.default
            
            func caculateCache() -> Float{
                var total: Float = 0
                if fileManager.fileExists(atPath: basePath!){
                    let childrenPath = fileManager.subpaths(atPath: basePath!)
                    if childrenPath != nil{
                        for path in childrenPath!{
                            let childPath = basePath?.appending("/").appending(path)
                            do{
                                let floder = try! FileManager.default.attributesOfItem(atPath: childPath!)
                                // 用元组取出文件大小属性
                                for (abc, bcd) in floder {
                                    // 累加文件大小
                                    if abc == FileAttributeKey.size {
                                        total += (bcd as AnyObject).floatValue
                                    }
                                }
                            }
                        }
                    }
                }
                return total
            }
            
            let totalCache = caculateCache()
            return NSString(format: "已使用 %.2f M", totalCache / 1024.0 / 1024.0 ) as String
        }
    }
    
    // 清除缓存
    class func clearCache() -> Bool{
        var result = true
        let basePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: basePath!){
            let childrenPath = fileManager.subpaths(atPath: basePath!)
            for childPath in childrenPath!{
                let cachePath = basePath?.appending("/").appending(childPath)
                do{
                    try fileManager.removeItem(atPath: cachePath!)
                }catch _{
                    result = false
                }
            }
        }
        return result
    }
}
