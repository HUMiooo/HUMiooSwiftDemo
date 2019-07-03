//
//  MyUpImageDownWordButton.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2017/6/28.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit

class MyUpImageDownWordButton: UIButton {
    // 屏蔽按钮高亮效果
    override var isHighlighted: Bool{
        get{
            return false
        }
        set{
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 设置视图
    private func setupUI(){
        // 设置imageView
        imageView?.contentMode = .center
        // 设置tilte
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.autoLayoutToSizeFont(12)
        setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    // 对其子控件重新布局
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置imageView
        imageView?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: (imageView?.bounds.size.height)!)
        // 设置title
        titleLabel?.frame = CGRect(x: 0, y: (imageView?.bounds.size.height)!, width: self.frame.width, height: self.frame.height - (imageView?.bounds.size.height)!)
    }
    
}
