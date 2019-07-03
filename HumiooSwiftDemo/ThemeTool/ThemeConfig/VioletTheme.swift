//
//  VioletTheme.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/15.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
class VioletTheme: ThemeProtocol {
    var backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#F4F2F7")
        }
    }
    var  Nav_backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#8E6CFF")
        }
    }
    var  Tab_backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#8E6CFF")
        }
    }
    var navTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#FFFFFF")
        }
    }
    var tabTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#FFFFFF")
        }
    }
    var titleTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#8E8569")
        }
    }
    var detailTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#8E8577")
        }
    }
}
