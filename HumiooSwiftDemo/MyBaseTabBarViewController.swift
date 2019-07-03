//
//  MyBaseTabBarViewController.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/16.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit

class MyBaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarVC()
        self.changeTheme()

    }
    func setTabBarVC() {
        let homeVC = FirstViewController()
        self.addChildViewController(childerVC: homeVC, title: "First", normalImg: "tabbar_homepage_btn_normal", selectedImg: "tabbar_homepage_btn_selected")

        let treasureBoxVC = SecondViewController()
        self.addChildViewController(childerVC: treasureBoxVC, title: "Second", normalImg: "tabbar_classification_btn_normal", selectedImg: "tabbar_classification_btn_selected")

        let myShowVC = ThirdViewController()
        self.addChildViewController(childerVC: myShowVC, title: "Third", normalImg: "tabbar_discovery_btn_normal", selectedImg: "tabbar_discovery_btn_selected")

        let memberCenterVc = ForthViewController()
        self.addChildViewController(childerVC: memberCenterVc, title: "Forth", normalImg: "tabbar_personalcenter_btn_normal", selectedImg: "tabbar_personalcenter_btn_selected")

        self.selectedIndex = 0
    }
    
    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
        self.tabBar.tintColor = UIColor.colorWithHexString(hex: "#FFFFFF")
        self.tabBarController?.hidesBottomBarWhenPushed = true;
//        self.tabBar.shadowImage = UIImage.image_SHADOW_IMAGE_FromColor(color: MYCOLOR_FFFFFF)
//        self.tabBar.backgroundImage = UIImage.image_SHADOW_IMAGE_FromColor(color: MYCOLOR_FFFFFF)
        
        childerVC.title = title as String
//        图标使用原始颜色
//        var norImg = UIImage(named:normalImg as String)
//        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
//        var selImg = UIImage(named:selectedImg as String)
//        selImg = selImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
//        let tabItem = UITabBarItem(title: title as String, image: norImg,selectedImage: selImg)
        let tabItem = UITabBarItem(title: title as String, image: UIImage(named: normalImg as String),selectedImage: UIImage(named: selectedImg as String))

        let naVc = MyBaseNavigationController()
        naVc.tabBarItem = tabItem
        naVc.addChild(childerVC)
        
        self.addChild(naVc)
    }

    func changeTheme() {
        NotificationCenter.default.addObserver(self, selector: #selector(handelNotification(notification:)), name: ThemeNotifacationName, object: nil)
        ThemeManager.themeUpdate()
    }
    
    @objc func handelNotification(notification: NSNotification) {
        guard let theme = notification.object as? ThemeProtocol else {
            return
        }
        self.tabBar.tintColor = theme.tabTextColor
        self.tabBar.backgroundColor = theme.Tab_backgroundColor
        self.tabBar.shadowImage = UIImage.image_SHADOW_IMAGE_FromColor(color: theme.Tab_backgroundColor)
        self.tabBar.backgroundImage = UIImage.image_SHADOW_IMAGE_FromColor(color: theme.Tab_backgroundColor)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("释放")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
