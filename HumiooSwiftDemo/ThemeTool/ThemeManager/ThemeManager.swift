//
//  ThemeManager.swift
//  CEThemeSwitcher
//
//  Created by Mr.LuDashi on 2017/1/12.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

import UIKit

let ThemeNotifacationName = NSNotification.Name("keyThemeNotifacation")

class ThemeManager: NSObject {
    var themeArray:NSArray = [VioletTheme(),BlackTheme(),BlueTheme(),GreenTheme()]
    
    /// 当前使用的主题
    var theme: ThemeProtocol = VioletTheme()

    /// ThemeManager的单例
    static var manager: ThemeManager? = nil
    static func shareInstance() -> ThemeManager {
        if manager == nil {
            manager = ThemeManager()
            manager?.theme = manager?.themeArray[currentThemeType!] as! ThemeProtocol
        }
        return manager!
    }
    
    // MARK: - 便利方法
    /// 切换主题的便利方法
    ///
    /// - Parameter type: 要切换主题的枚举类型
    static func switcherTheme(type: ThemeType){
        ThemeManager.shareInstance().switcherTheme(type: type)
    }
    
    /// 更新主题的便利方法
    static func themeUpdate() {
        NotificationCenter.default.post(name: ThemeNotifacationName, object: ThemeManager.shareInstance().theme)
    }

    //MARK: - Private Method
    /// ThemeManager的私有构造器
    private override init() {}
    
    /// 切换主题的方法
    ///
    /// - Parameter type: 要切换主题的枚举类型
    private func switcherTheme(type: ThemeType){
        self.theme = type.theme
        NotificationCenter.default.post(name: ThemeNotifacationName, object: self.theme)
    }
}
