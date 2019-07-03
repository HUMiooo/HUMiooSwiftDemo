//
//  ZNTitleView.swift
//  pageFlowView
//
//  Created by 马明波 on 2017/3/29.
//  Copyright © 2017年 zn. All rights reserved.
//

import UIKit

protocol ZNTitleViewDelegate : class {
    func titleView(_ titleView: ZNTitleView , targetIndex : Int)
}

class ZNTitleView: UIView {
    weak var delegate : ZNTitleViewDelegate?
    fileprivate var titles : [String]
    fileprivate var style : ZNTitleStyle
    fileprivate lazy var currentIndex : Int = 0
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    fileprivate var titleLables : [UILabel] = [UILabel]()
    
    init(frame: CGRect,titles : [String] ,style : ZNTitleStyle) {
        self.titles = titles
        self.style = style
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}



extension ZNTitleView{

    fileprivate func setupUI() {
        //添加uiscrollview
        addSubview(scrollView)
        
        //将titleLable添加到scrollview中
        setupTitleLables()
        
        //设置titlelalbe的frame
        setupTitleLablesFrame()
    }
    
    
    private func setupTitleLables() {
        
        for (i,title) in titles.enumerated() {
            
            let titleLable = UILabel()
            titleLable.text = title
            titleLable.tag = i
            titleLable.textAlignment = .center
            titleLable.font = UIFont.systemFont(ofSize: style.fontSize)
            titleLable.textColor = i == 0 ? style.selectColor : style.normalColor
            scrollView.addSubview(titleLable)
            titleLables.append(titleLable)
            
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLableClick(_:)))
            titleLable.addGestureRecognizer(tapGes)
            titleLable.isUserInteractionEnabled = true
            
        }
        
    }
    
    
    private func setupTitleLablesFrame() {
        
        let count = titles.count
        
        for (i,lable) in titleLables.enumerated() {
            
            var x : CGFloat = 0
            let y : CGFloat = 0
            var w : CGFloat = 0
            let h : CGFloat = bounds.height
            
            if style.isScrollEnable {
                w = (titles[i] as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 0), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : lable.font as Any], context: nil).width
                if i==0 {
                    x = style.itemMargin * 0.5
                    
                }else{
                    let preLalbe = titleLables[i - 1]
                    x = preLalbe.frame.maxX + style.itemMargin
                }
                
            }else{  // 不能滚动
                w = bounds.width / CGFloat(count)
                x = w * CGFloat(i)
            }
            lable.frame = CGRect(x: x, y: y, width: w, height: h)
        }
        scrollView.contentSize = style.isScrollEnable ? CGSize(width: titleLables.last!.frame.maxX + style.itemMargin * 0.5, height: 0) : CGSize.zero
    }

}


//MARK : 监听事件
extension ZNTitleView{

    @objc fileprivate func titleLableClick(_ tapGes : UITapGestureRecognizer) {
        
        let targetLable = tapGes.view as! UILabel
        adjustTitleLabel(targetIndex: targetLable.tag)
        delegate?.titleView(self, targetIndex: currentIndex)
    }
    fileprivate func adjustTitleLabel(targetIndex : Int) {
        
        if targetIndex == currentIndex {
            return
        }
        //取出lable
        let targetLable = titleLables[targetIndex]
        let sourceLable = titleLables[currentIndex]
        
        targetLable.textColor = style.selectColor
        sourceLable.textColor = style.normalColor
        
        //记录下下标值
        currentIndex = targetIndex
        
        if style.isScrollEnable {
            var offsetX = targetLable.center.x - scrollView.bounds.width * 0.5
            if offsetX < 0  {
                offsetX = 0
            }
            if offsetX > (scrollView.contentSize.width - scrollView.bounds.width) {
                offsetX = scrollView.contentSize.width - scrollView.bounds.width
            }
            
            scrollView.setContentOffset(CGPoint(x:offsetX,y:0), animated: true)
        }
    }
}


//MARK:  contentView代理方法 
extension ZNTitleView : ZNContentViewDelegate{

    func ZNContentView(_ contentView: ZNContentView, targetIndex: Int) {
        adjustTitleLabel(targetIndex: targetIndex)
    }
}





