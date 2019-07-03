//
//  SubView.swift
//  CEThemeSwitcher
//
//  Created by Mr.LuDashi on 2017/1/13.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

import UIKit

class SubView: UIView {    
    var titleLabel: TitleLabel!
    var detailLabel: DetailLable!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
    }
    
    func addSubViews() {
        self.titleLabel = TitleLabel(frame: CGRect(x: 0, y: 0, width:self.frame.size.width, height: 18))
        self.addSubview(self.titleLabel)
        
        self.detailLabel = DetailLable(frame: CGRect(x: 0, y: 20, width: self.frame.size.width, height:15))
        self.addSubview(self.detailLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
