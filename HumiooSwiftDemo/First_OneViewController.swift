//
//  First_OneViewController.swift
//  HUMiooSwiftDemo
//
//  Created by HUMioo on 2018/5/14.
//  Copyright © 2018年 HUMiooZcs. All rights reserved.
//

import UIKit
import TangramKit
class First_OneViewController: MyRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First_One"
//        let FL = TGFrameLayout(frame: self.view.bounds)
//        FL.backgroundColor = .white
//        self.view = FL
        
//        let a = add1(1, 2)
//        let b = add2(1)(2)
//        let c = add3(1)(2)
//        let d = add4(1)(2)
//        print("\(a)\n\(b)\n\(c)\n\(d)")
//
//        print(test1(num: 99))
        
        for i in stride(from: 4, to: -1 ,by: -1) {
            for j in stride(from: 19, to: -1 ,by: -1) {
                print("\(i)  \(j)")
                let result = j + 20 * i
                let label = UILabel()
                label.frame = CGRect(x: 20 + (4 - i) * 50, y: 20 + (19 - j) * 20, width: 50, height: 20)
                label.text = String(result)
                self.view.addSubview(label)
            }
        }
    }
    func add1(_ x: Int, _ y: Int) -> Int {
        return x + y
    }
    func add2(_ x: Int) -> ((Int) -> Int) {
        return { y in x + y }
    }
    func add3(_ x: Int) -> (Int) -> Int {
        return { y in x + y }
    }
    func add4(_ x: Int) -> (( _ y: Int) -> Int) {
        return { y in x + y }
    }
    func test1(num:Int) ->Int{
        var NUM = num
        for _ in 0 ..< String(num).count {
            NUM = test2(num: NUM)
        }
        return NUM
    }
    func test2(num:Int) ->Int{
        let num_A = num/10
        let num_B = num-10*num_A
        return num_A*num_B
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
