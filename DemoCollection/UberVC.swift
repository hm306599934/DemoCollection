//
//  UberVC.swift
//  DemoCollection
//
//  Created by Jimmy on 29/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//
//  参考：http://www.jiarui-blog.com/2016/08/12/uber-splash-part1/

import UIKit

class UberVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let view = UberLogoView(frame: CGRectMake(100, 100, 100, 100))
        view.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(view)
    }
}
