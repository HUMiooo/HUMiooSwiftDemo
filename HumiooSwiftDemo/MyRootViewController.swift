//
//  MyRootViewController.swift
//  HUMiooSwiftDemo
//
//  Created by Humioo on 2019/7/3.
//  Copyright © 2019 HUMioo.p. All rights reserved.
//

import UIKit

class MyRootViewController: UIViewController, ThemeManagerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.changeTheme()

    }
    
    func changeTheme() {
        NotificationCenter.default.addObserver(self, selector: #selector(handelNotification(notification:)), name: ThemeNotifacationName, object: nil)
        ThemeManager.themeUpdate()
    }
    
    @objc func handelNotification(notification: NSNotification) {
        guard let theme = notification.object as? ThemeProtocol else {
            return
        }
        
        self.view.backgroundColor = theme.backgroundColor
        
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: theme.navTextColor,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        navigationController?.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : AnyObject]
        
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: theme.Nav_backgroundColor), for: .any, barMetrics: .default)
        
        //        self.tabBarController?.tabBar.shadowImage = UIImage.image_SHADOW_IMAGE_FromColor(color: theme.Nav_Tab_backgroundColor)
        //        self.tabBarController?.tabBar.backgroundImage = UIImage.image_SHADOW_IMAGE_FromColor(color: theme.Nav_Tab_backgroundColor)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("释放")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
