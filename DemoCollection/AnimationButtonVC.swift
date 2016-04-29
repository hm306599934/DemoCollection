//
//  AnimationButtonVC.swift
//  DemoCollection
//
//  Created by Tony on 28/4/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit
import SnapKit

class AnimationButtonVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationButton = DynamicButton(frame: CGRectMake(0, 0, 300, 40))
        animationButton.backgroundColor = UIColor.redColor()
        animationButton.setTitle("登录", forState: .Normal)
        self.view.addSubview(animationButton)
        
        animationButton.snp_makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.center.equalTo(self.view)
        }
    }
}