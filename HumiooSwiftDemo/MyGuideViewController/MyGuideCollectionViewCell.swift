//
//  MyGuideCollectionViewCell.swift
//  AIJIAIJIASwift
//
//  Created by 赵春生 on 2017/6/26.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit

class MyGuideCollectionViewCell: UICollectionViewCell {
    fileprivate let newImageView = UIImageView(frame: SCREEN_BOUNDS)
    fileprivate let nextBtn = UIButton(frame: CGRect(x: (SCREEN_WIDTH - 100)*0.5, y: SCREEN_HEIGHT - 85 - STABAR_Height, width: 100, height: 33))
    
    var newImage:UIImage? {
        didSet{
            newImageView.image = newImage
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        newImageView.contentMode = UIView.ContentMode.scaleAspectFill
        contentView.addSubview(newImageView)
        
        nextBtn.setBackgroundImage(UIImage(named: "icon_next"), for: UIControl.State())
        nextBtn.addTarget(self, action: #selector(MyGuideCollectionViewCell.nextBtnClick), for: .touchUpInside)
        nextBtn.isHidden = true
        contentView.addSubview(nextBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNextBtnHidden(_ hidden:Bool) {
        nextBtn.isHidden = hidden
    }
    
    @objc func nextBtnClick() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: MyGuideViewControllerDidFinish), object: nil)
    }
    
}

