//
//  Second_OneViewController.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/22.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit

class Second_OneViewController: MyRootViewController,UIScrollViewDelegate {
    //图片数组
    var scrollView = UIScrollView()
    var pageControl : UIPageControl?
    lazy var imgArr: NSMutableArray = {
    var imgArr = NSMutableArray()
        imgArr.add(UIImage(named: "001")!)
        imgArr.add(UIImage(named: "002")!)
        imgArr.add(UIImage(named: "003")!)
        return imgArr
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        MyDebugLogTool.Log(message: imgArr)
        scrollView = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH/768.0*300))
        scrollView.backgroundColor = .red
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH*3, height: SCREEN_WIDTH/768.0*300)
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        self.view.addSubview(scrollView)
        
        let imv1 = UIImageView(image: imgArr[0] as? UIImage)
        print(imv1.bounds)
        imv1.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH/768.0*300)
        print(imv1.bounds)

        let imv2 = UIImageView(image: imgArr[1] as? UIImage)
        imv2.frame = CGRect(x: SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH/768.0*300)

        let imv3 = UIImageView(image: imgArr[2] as? UIImage)
        imv3.frame = CGRect(x: SCREEN_WIDTH*2, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH/768.0*300)

        scrollView.addSubview(imv1)
        scrollView.addSubview(imv2)
        scrollView.addSubview(imv3)

        MyDebugLogTool.Log(message: SCREEN_WIDTH)
        
        self.pageControl = UIPageControl(frame: CGRect(x: SCREEN_WIDTH/2-60,
                                                       y: SCREEN_WIDTH/768.0*300 - 20, width: 120, height: 20))
        self.pageControl?.numberOfPages = (imgArr.count)
        self.pageControl?.isUserInteractionEnabled = false
        self.view.addSubview(self.pageControl!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
