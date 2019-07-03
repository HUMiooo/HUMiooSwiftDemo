//
//  MyBaseNavigationController.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2017/6/26.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit

class MyBaseNavigationController: UINavigationController {
    
    var isAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = nil
        
        // Do any additional setup after loading the view.
    }
    
    lazy var backBtn: UIButton = {
        
        //设置返回按钮属性
        let backBtn = UIButton(type: UIButton.ButtonType.custom)
        backBtn.setImage(UIImage(named: "navigationbar_back_black_btn_normal"), for: UIControl.State())
        backBtn.titleLabel?.isHidden = true
        backBtn.addTarget(self, action: #selector(MyBaseNavigationController.backBtnClick), for: .touchUpInside)
        backBtn.contentHorizontalAlignment = .left
        backBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 28)
//        backBtn.backgroundColor = .red
        
        return backBtn
    }()
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.hidesBackButton = true
        if children.count > 0 {
            UINavigationBar.appearance().backItem?.hidesBackButton = false
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    @objc func backBtnClick() {
        popViewController(animated: isAnimation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
