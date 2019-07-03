//
//  ThirdViewController.swift
//  MySwiftDemo
//
//  Created by 赵春生 on 2018/5/10.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
class ThirdViewController: MyRootViewController, UITableViewDelegate, UITableViewDataSource {
    let cellReuseIdentifier: String = "ThemeSwitcherCell"
    var switcher: UISwitch!
    var tableView: UITableView!
    var selectIndexRow: Int = currentThemeType!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTableVew()
    }
    
    func addTableVew() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-TABBAR_Height-NAVBAR_Height))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.register(ThemeSwitcherCell.self, forCellReuseIdentifier: self.cellReuseIdentifier)
        self.view.addSubview(self.tableView)
    }

    override func handelNotification(notification: NSNotification) {
        guard let theme = notification.object as? ThemeProtocol else {
            return
        }
        if self.tableView != nil {
            self.tableView.backgroundColor = theme.backgroundColor
        }
        let dict:NSDictionary = [NSAttributedString.Key.foregroundColor: theme.navTextColor,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        navigationController?.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : AnyObject]
        navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: theme.Nav_backgroundColor), for: .any, barMetrics: .default)
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ThemeSwitcherCell? = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier) as? ThemeSwitcherCell
        
        if cell == nil {
            cell = ThemeSwitcherCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cellReuseIdentifier)
        }
        
        if indexPath.row == self.selectIndexRow {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        
        cell!.configCell(index: indexPath.row)
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndexRow = indexPath.row
        self.tableView.reloadData()
        UserDefaults.set(value: String(indexPath.row), forKey: .themeType)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
