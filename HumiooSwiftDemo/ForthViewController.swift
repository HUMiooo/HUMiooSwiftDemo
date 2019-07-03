//
//  ForthViewController.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/10.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
import TangramKit
class ForthViewController: MyRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.loadView()
        
        let BK = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-TABBAR_Height-STA_NAV_Height))
//        BK.contentSize = CGSize(width: SCREEN_WIDTH, height: BK.height)
        BK.contentSize = CGSize(width: SCREEN_WIDTH, height: BK.height)
        BK.backgroundColor = .white
        self.view.addSubview(BK)
        
        
        let S = TGFlowLayout(.vert,arrangedCount:4)
        S.tg_height.equal(.wrap)
        S.tg_width.equal(SCREEN_WIDTH)
//        S.tg_width ~= SCREEN_WIDTH
        S.tg_padding = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        S.tg_gravity = TGGravity.horz.fill
        S.tg_space = 10
        S.backgroundColor = .white

        for index in 0..<31 {
            let A = UILabel()
            A.tg_height.equal(A.tg_width)
            A.backgroundColor = UIColor.RandomColor()
            A.text = String(index)
            S.addSubview(A)
        }
//        for num in numberList.enumerated() {
//            let A = UILabel()
//            A.tg_height.equal(A.tg_width)
//            A.backgroundColor = UIColor.RandomColor()
//            A.text = NSString.init(format: "%d", num.offset) as String
//            S.addSubview(A)
//        }
        
        BK.addSubview(S)
        
        let G = TGLinearLayout(.vert)
        G.tg_width ~= .fill
        G.tg_height ~= (.wrap)
        S.addSubview(G)
        
        
        let G1 = UIView()
        G1.tg_left.equal(20%)
        G1.tg_right.equal(30%)
        G1.tg_height.equal(G1.tg_width)
        G1.backgroundColor = .red
        G.addSubview(G1)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
