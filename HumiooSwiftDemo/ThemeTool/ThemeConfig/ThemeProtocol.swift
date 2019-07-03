//
//  ThemeProtocol.swift
//  CEThemeSwitcher
//
//  Created by Mr.LuDashi on 2017/1/13.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

import UIKit

/// 主题协议，所有的主题要遵循该协议
protocol ThemeProtocol {
    var backgroundColor: UIColor {get}
    var Nav_backgroundColor: UIColor {get}
    var Tab_backgroundColor: UIColor {get}
    var navTextColor: UIColor {get}
    var tabTextColor: UIColor {get}
    var titleTextColor: UIColor {get}
    var detailTextColor: UIColor {get}
}

/// 主题类型枚举, 其中包含了一个简单工厂方法，用来创建Theme主题类的对象
enum ThemeType {
    case violetTheme
    case blackTheme
    case blueTheme
    case greenTheme
    /// 主题类型所对应的主题对象
    var theme: ThemeProtocol {
        get {
            switch self {
                case .violetTheme:
                    return VioletTheme()
                case .blackTheme:
                    return BlackTheme()
                case .blueTheme:
                    return BlueTheme()
                case .greenTheme:
                    return GreenTheme()
            }
        }
    }
}
