//
//  BezierPathVC.swift
//  DemoCollection
//
//  Created by Jimmy on 6/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

class BezierPathVC: UIViewController {
    
    @IBOutlet weak var mView: BezierPathView!
    
    var count: CGFloat = 0
    var timer: NSTimer?
    let layer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(BezierPathVC.showView), userInfo: nil, repeats: true)
        timer?.fire()
        
       
        layer.strokeEnd = 0
        layer.lineWidth = 10
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.redColor().CGColor
        
        self.view.layer.addSublayer(layer)
        
        self.performSelector(#selector(BezierPathVC.showAnimation), withObject: nil, afterDelay: 3)
        
       
    }
    
    func showView() {
        
        mView.percent = count % 100 / 100
        mView.setNeedsDisplay()
        
        count += 0.2
        
       
    }
    
    func showAnimation() {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(3)
        self.layer.path = UIBezierPath(arcCenter: self.view.center, radius: 20, startAngle: 0, endAngle: 2*CGFloat(M_PI), clockwise: true).CGPath
        self.layer.strokeEnd = 1
        CATransaction.commit()
    }
    
    
}