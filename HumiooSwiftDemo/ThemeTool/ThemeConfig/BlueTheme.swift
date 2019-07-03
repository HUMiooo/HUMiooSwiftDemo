//
//  BlueTheme.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/17.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
class BlueTheme: ThemeProtocol {
    var backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#FFFFFF")
        }
    }
    var Nav_backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#77AAEC")
        }
    }
    var Tab_backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#FFFFFF")
        }
    }
    var navTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#FFFFFF")
        }
    }
    var tabTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#77AAEC")
        }
    }
    
    var titleTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#999999")
        }
    }
    
    var detailTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#333333")
        }
    }
}
