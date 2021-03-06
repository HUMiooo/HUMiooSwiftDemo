//
//  AppDelegate.swift
//  HUMiooSwiftDemo
//
//  Created by Humioo on 2019/7/3.
//  Copyright © 2019 HUMioo.p. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = UIColor.white
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.isTranslucent = false
        
        //接收引导页"立即体验"按钮点击事件的通知
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.loadHomeViewController), name: NSNotification.Name(rawValue: "MyGuideViewControllerDidFinish"), object: nil)
        
        createKeyWindow()
        return true
    }
    
    fileprivate func createKeyWindow() {
        window = UIWindow(frame: SCREEN_BOUNDS)
        window?.makeKeyAndVisible()
        
        //判断是否是第一次开启应用
        let isFirstOpen = UserDefaults.standard.object(forKey: "First")
        if isFirstOpen == nil {
            //第一次打开应用
            window?.rootViewController = MyGuideViewController()
            
            UserDefaults.standard.set("First", forKey: "First")
        } else {
            //不是第一次打开应用
            loadHomeViewController()
        }
        ThemeManager.themeUpdate()
    }
    
    @objc func loadHomeViewController() {
        window?.rootViewController = MyBaseTabBarViewController()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

