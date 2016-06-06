//
//  DynamicButton.swift
//  DemoCollection
//
//  Created by Tony on 28/4/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

class DynamicButton: UIButton {
    
    var spiner: CircleLayer?
    var shrinkCurve: CAMediaTimingFunction?
    var expandCurve: CAMediaTimingFunction?
    let shrinkDuration: CFTimeInterval = 0.1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spiner = CircleLayer()
        spiner!.initWifthFrame(frame)
        shrinkCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        expandCurve = CAMediaTimingFunction(controlPoints: 0.95, 0.02, 1, 0.05)
        self.layer.addSublayer(spiner!)
        
        self.layer.cornerRadius = self.frame.height / 2
        
        self.clipsToBounds = true
        
        self.addTarget(self, action: #selector(DynamicButton.scaleToSmall), forControlEvents: .TouchDown)
        self.addTarget(self, action: #selector(DynamicButton.scaleToAnimation), forControlEvents: .TouchUpInside)
        self.addTarget(self, action: #selector(DynamicButton.scaleToDefault), forControlEvents: .TouchDragExit)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func scaleToSmall() {
        
        self.transform = CGAffineTransformMakeScale(1, 1);
        UIView.animateWithDuration(0.3) { 
            self.transform = CGAffineTransformMakeScale(0.9, 0.9)
        }
    }
    
    func scaleToAnimation() {
        UIView.animateWithDuration(0.3) {
            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }
        startAnimation()
    }
    
    func scaleToDefault() {
        self.transform = CGAffineTransformMakeScale(1, 1);
        UIView.animateWithDuration(0.3) {
            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
        }
    }
    
    func startAnimation() {
        revert()
        self.layer.addSublayer(spiner!)
        let shrinkAnim = CABasicAnimation(keyPath: "bounds.size.width")
        shrinkAnim.fromValue = self.frame.size.width
        shrinkAnim.toValue = self.frame.size.height
        shrinkAnim.duration = shrinkDuration
        shrinkAnim.timingFunction = shrinkCurve
        shrinkAnim.fillMode = kCAFillModeForwards
        shrinkAnim.removedOnCompletion = false
        self.layer.addAnimation(shrinkAnim, forKey: shrinkAnim.keyPath)
        spiner?.startAnimation()
        self.userInteractionEnabled = false
    }
    
    func revert() {
        let backgroundColor = CABasicAnimation(keyPath: "backgroundColor")
        backgroundColor.toValue = self.backgroundColor?.CGColor
        backgroundColor.duration = 0.1
        backgroundColor.timingFunction = shrinkCurve
        backgroundColor.fillMode = kCAFillModeForwards
        backgroundColor.removedOnCompletion = false
        self.layer.addAnimation(backgroundColor, forKey: "backgroundColors")
    }
    
}