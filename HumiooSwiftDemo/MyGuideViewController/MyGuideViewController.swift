//
//  MyGuideViewController.swift
//  AIJIAIJIASwift
//
//  Created by 赵春生 on 2017/6/26.
//  Copyright © 2017年 zcs. All rights reserved.
//

import UIKit

class MyGuideViewController: MyRootViewController {
    fileprivate var collectionView:UICollectionView?
    fileprivate var imageNames = ["A-1", "A-2", "A-3", "A-4"]
    fileprivate let cellIdentifier = "GuideCell"
    fileprivate var isHiddenNextButton = true
    fileprivate var pageController = UIPageControl(frame: CGRect(x: 0, y: SCREEN_HEIGHT - 50, width: SCREEN_WIDTH, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.setStatusBarHidden(false, with: .none)
        createCollectionView()
        createPageControll()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- UICollectionView
    func createCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = SCREEN_BOUNDS.size
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: SCREEN_BOUNDS, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        collectionView?.register(MyGuideCollectionViewCell.self , forCellWithReuseIdentifier: cellIdentifier)
        view.addSubview(collectionView!)
    }
    
    fileprivate func createPageControll() {
        pageController.numberOfPages = imageNames.count
        pageController.currentPage = 0
        view.addSubview(pageController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyGuideViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MyGuideCollectionViewCell
        cell.newImage = UIImage(named: imageNames[(indexPath as NSIndexPath).row])
        if (indexPath as NSIndexPath).row != imageNames.count - 1 {
            cell.setNextBtnHidden(true)
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == SCREEN_WIDTH * CGFloat(imageNames.count - 1) {
            let cell = collectionView?.cellForItem(at: IndexPath(row: imageNames.count - 1, section: 0)) as! MyGuideCollectionViewCell
            cell.setNextBtnHidden(false)
            isHiddenNextButton = false
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x != SCREEN_WIDTH * CGFloat(imageNames.count - 1) && !isHiddenNextButton && scrollView.contentOffset.x > SCREEN_WIDTH * CGFloat(imageNames.count - 2) {
            let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: IndexPath(row: imageNames.count - 1, section: 0)) as! MyGuideCollectionViewCell
            cell.setNextBtnHidden(true)
            isHiddenNextButton = true
        }
        pageController.currentPage = Int(scrollView.contentOffset.x / SCREEN_WIDTH + 0.5)
    }
}
