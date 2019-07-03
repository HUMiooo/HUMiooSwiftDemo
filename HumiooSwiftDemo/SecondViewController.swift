//
//  SecondViewController.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/10.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit

class SecondViewController: MyRootViewController {
    var colorStr = String()
    fileprivate let button = UIButton(frame: CGRect(origin: CGPoint(x: SCREEN_WIDTH/2-50, y: 50), size: CGSize(width: 100, height: 40)))

    fileprivate var label = UILabel(frame: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 100)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if colorStr == "yellow" {
            label.backgroundColor = UIColor.yellow
        } else {
            label.backgroundColor = UIColor.red
        }
        self.view.addSubview(label)
        
        button.setTitle("BTN1", for: .normal)
        button.backgroundColor = UIColor.colorWithRGB(3, g: 252, b:  254)
        button.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc func btnClick(btn:UIButton) {
        self.navigationController?.pushViewController(Second_OneViewController(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
