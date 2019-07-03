//
//  BlackTheme.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/16.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
class BlackTheme: ThemeProtocol {
    var backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#2D253A")
        }
    }
    var Nav_backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#2D253A")
        }
    }
    var Tab_backgroundColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#2D253A")
        }
    }
    var navTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#FFFFFF")
        }
    }
    var tabTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#4ED1C1")
        }
    }
    
    var titleTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#4ED1C1")
        }
    }
    
    var detailTextColor: UIColor {
        get {
            return UIColor.colorWithHexString(hex: "#3BB6DA")
        }
    }
}
