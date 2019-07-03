//
//  GreenTheme.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/17.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
class GreenTheme: ThemeProtocol {
    var backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#FFFFFF")
        }
    }
    var Nav_backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#3DCF94")
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
            return UIColor.colorWithHexString(hex: "#3DCF94")
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
