//
//  ThemeSwitcherCell.swift
//  CEThemeSwitcher
//
//  Created by Mr.LuDashi on 2017/1/16.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

import UIKit

enum CellTitleType: Int {
    case Violet
    case Black
    case Blue
    case Green
    var title : String {
        get {
            switch self {
            case .Violet:
                return "紫罗兰"
            case .Black:
                return "黑色"
            case .Blue:
                return "蓝色"
            case .Green:
                return "绿色"
            }
            
        }
    }
    var detail : String {
        get {
            switch self {
            case .Violet:
                return "紫罗兰"
            case .Black:
                return "黑色"
            case .Blue:
                return "蓝色"
            case .Green:
                return "绿色"
            }
        }
    }
    var themeType : ThemeType {
        get {
            switch self {
            case .Violet:
                return .violetTheme
            case .Black:
                return .blackTheme
            case .Blue:
                return .blueTheme
            case .Green:
                return .greenTheme
            }
        }
    }
}

class ThemeSwitcherCell: UITableViewCell {
    var customeView: SubView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        self.addAllSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAllSubviews()  {
        customeView = SubView(frame: CGRect(x: 20, y: 8, width: 200, height: 50))
        self.addSubview(customeView)
    }
    
    func configCell(index: Int) {
        guard let cellType: CellTitleType = CellTitleType(rawValue: index) else {
            return
        }
        customeView.titleLabel.text = cellType.title
        customeView.detailLabel.text = cellType.detail
        
        if self.accessoryType == .checkmark {
            self.switherTheme(type: cellType)
        }
    }
    
    func switherTheme(type: CellTitleType) {
        ThemeManager.switcherTheme(type: type.themeType)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
