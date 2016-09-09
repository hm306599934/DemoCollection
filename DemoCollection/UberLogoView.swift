//
//  UberLogoView.swift
//  DemoCollection
//
//  Created by Jimmy on 29/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

class UberLogoView: UIView {
    
    var circleLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initial()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initial()
    }

    func initial() {

    }
    
    override func drawRect(rect: CGRect) {
//        let color = UIColor.redColor()
//        color.set()
//        
//        let bezierPath = UIBezierPath()
//        bezierPath.addArcWithCenter(CGPointMake(50, 50), radius: 30, startAngle: -CGFloat(M_PI_2), endAngle: CGFloat(3 * M_PI_2), clockwise: true)
//        bezierPath.lineCapStyle = .Round
//        bezierPath.lineJoinStyle = .Round
//        bezierPath.fill()
//        
//        let strokeEndAnimation = CAKeyframeAnimation(keyPath: "position")
//        strokeEndAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
//        strokeEndAnimation.duration = 3
//        strokeEndAnimation.repeatCount = 10
//        strokeEndAnimation.values = [0.0, 1.0]
//        strokeEndAnimation.keyTimes = [0.0, 1.0]
//        circleLayer.addAnimation(strokeEndAnimation, forKey: "StrokeEndAnimation")
    }
    
}

