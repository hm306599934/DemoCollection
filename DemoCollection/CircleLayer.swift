//
//  CircleLayer.swift
//  DemoCollection
//
//  Created by Tony on 29/4/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {
    
    func initWifthFrame(frame: CGRect) {
        let radius = (CGRectGetHeight(frame) / 2) * 0.5
        self.frame = CGRectMake(0, 0, CGRectGetHeight(frame), CGRectGetHeight(frame))
        let center = CGPointMake(CGRectGetHeight(frame) / 2, CGRectGetMidY(self.bounds))
        let startAngle = CGFloat(0 - M_PI_2)
        let endAngle = CGFloat(M_PI * 2 - M_PI_2)
        self.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        self.fillColor = nil;
        self.strokeColor = UIColor.whiteColor().CGColor
        self.lineWidth = 2;
        self.strokeEnd = 0.4;
        self.hidden = true;
    }
    
    func startAnimation() {
        self.hidden = false
        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        rotate.fromValue = 0
        rotate.toValue = M_PI * 2
        rotate.duration = 0.6
        rotate.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        rotate.repeatCount = HUGE
        rotate.fillMode = kCAFillModeForwards
        rotate.removedOnCompletion = false
        self.addAnimation(rotate, forKey: rotate.keyPath)
    }
    
    func stopAnimation() {
        self.hidden = true
        self.removeAllAnimations()
    }
}


