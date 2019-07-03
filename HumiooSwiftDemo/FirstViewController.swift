//
//  FirstViewController.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/10.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Kingfisher
class FirstViewController: MyRootViewController,NVActivityIndicatorViewable {
    
    fileprivate let button = UIButton(frame: CGRect(origin: CGPoint(x: SCREEN_WIDTH/2-50, y: 100), size: CGSize(width: 100, height: 40)))
    let na = NVActivityIndicatorView(frame: CGRect(x: SCREEN_WIDTH/2-50, y: 200, width: 100, height: 100), type: NVActivityIndicatorType.lineScalePulseOutRapid, color: UIColor.colorWithHexString(hex: "#0000CD"), padding: 0)
    let imageView = UIImageView(frame: CGRect(x: 0, y: 320, width: 200, height:200))
    let an = AnimatedMaskLabel.init(frame: CGRect(x: 50, y: 200, width: 200, height: 80))
    let window = UIApplication.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("BTN1", for: .normal)
        button.backgroundColor = UIColor.colorWithRGB(3, g: 252, b:  254)
        button.addTarget(self, action: #selector(btnClick1(btn:)), for: .touchUpInside)
        self.view.addSubview(button)
        self.view.addSubview(na)
        imageView.contentMode = .scaleAspectFill
        imageView.center = self.view.center
        self.view.addSubview(imageView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        an.text = "AAAAAAAAAA"
        an.tag = 1000
        self.view.addSubview(an)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        an.didMoveToWindow()
        self.view.viewWithTag(1000)?.removeFromSuperview()
    }
    @objc func btnClick1(btn:UIButton) {
        self.navigationController?.pushViewController(First_OneViewController(), animated: true)
//        na.startAnimating()
//        imageView.kf.setImage(with: URL(string: "http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg"), placeholder: nil, options: nil, progressBlock: nil) { (image, error, nil, imageURL)  in
//            self.na.stopAnimating()
//        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
