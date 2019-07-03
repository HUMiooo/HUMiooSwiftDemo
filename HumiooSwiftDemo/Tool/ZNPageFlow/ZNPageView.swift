//
//  ZNPageView.swift
//  pageFlowView
//
//  Created by 马明波 on 2017/3/29.
//  Copyright © 2017年 zn. All rights reserved.
//

import UIKit

class ZNPageView: UIView {

    fileprivate var titles : [String]
    fileprivate var childsVc : [UIViewController]
    fileprivate var parentVc : UIViewController
    fileprivate var style : ZNTitleStyle
    fileprivate var titleView : ZNTitleView!
    init(frame: CGRect,titles :[String],childsVc : [UIViewController],parentVc : UIViewController,style : ZNTitleStyle) {
        self.titles = titles
        self.childsVc = childsVc
        self.parentVc = parentVc
        self.style = style
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: 设置UI
extension ZNPageView{

    fileprivate func setupUI(){
        setupTitleView()
        setupContentView()
    }
    
    private func setupTitleView() {
        
        let titleFrame = CGRect(x: 0, y: 0, width: bounds.width, height: style.titleHeight)
        titleView = ZNTitleView(frame: titleFrame, titles: titles,style : style)
        addSubview(titleView)
        titleView.backgroundColor = UIColor.white
        
    }
    
    private func setupContentView() {
        let contentFrame = CGRect(x: 0, y: style.titleHeight, width: bounds.width, height: bounds.height - style.titleHeight)
        let contentView = ZNContentView(frame: contentFrame, childVcs: childsVc, parentVc: parentVc)
        addSubview(contentView)
        contentView.backgroundColor = UIColor.clear
        
        //设置代理
        titleView.delegate = contentView
        contentView.delegate = titleView
    }

}
