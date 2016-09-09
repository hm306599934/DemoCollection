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
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let view = UberLogoView(frame: CGRectMake(100, 100, 100, 100))
        view.backgroundColor = UIColor.clearColor()
        self.view.addSubview(view)
        
        animation1(view)
        animation2(view)
        animation3(view)
    }
    
    func animation1(view: UIView) {
        let circleLayer = CAShapeLayer()
        circleLayer.frame = CGRectMake(0, 0, 100, 100)
        
        let startAngle = CGFloat(-M_PI)
        let endAngle = CGFloat(M_PI)
        
        circleLayer.path = UIBezierPath(arcCenter: CGPointMake(50, 50), radius: 25, startAngle: startAngle, endAngle: endAngle, clockwise: true).CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = UIColor.whiteColor().CGColor
        circleLayer.lineWidth = 50
        circleLayer.strokeEnd = 0.1
        view.layer.addSublayer(circleLayer)
        
        //转圈动画
        let rotateAnimation = CABasicAnimation(keyPath: "strokeEnd")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = M_PI * 2
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rotateAnimation.fillMode = kCAFillModeForwards
        rotateAnimation.speed = 0.3
        rotateAnimation.duration = 2
        //circleLayer.addAnimation(rotateAnimation, forKey: rotateAnimation.keyPath)
        
        //旋转动画
        var startingTransform = CATransform3DMakeRotation(CGFloat(-M_PI_4), 0, 0, 1)
        startingTransform = CATransform3DScale(startingTransform, 0.1, 0.1, 1)
        let transformAnimation = CABasicAnimation(keyPath: "transform")
        transformAnimation.fromValue = NSValue(CATransform3D: startingTransform)
        transformAnimation.toValue = NSValue(CATransform3D: CATransform3DIdentity)
        transformAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transformAnimation.duration = 2
        //circleLayer.addAnimation(transformAnimation, forKey: transformAnimation.keyPath)
        
        //组合动画
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [rotateAnimation, transformAnimation]
        groupAnimation.repeatCount = Float.infinity // 无限重复动画
        groupAnimation.duration = 3
        
        circleLayer.addAnimation(groupAnimation, forKey: "looping")
    }
    
    func animation2(view: UIView) {
        let lineLayer = CAShapeLayer()
        lineLayer.frame = CGRectMake(0, 50, 50, 0)
        lineLayer.backgroundColor = UIColor.redColor().CGColor
        view.layer.addSublayer(lineLayer)
        
        let biggerAnimation = CABasicAnimation(keyPath: "bounds.size")
        biggerAnimation.fromValue = NSValue(CGSize: CGSizeMake(50, 0))
        biggerAnimation.toValue = NSValue(CGSize: CGSizeMake(50, 5))
        biggerAnimation.duration = 0.5
        biggerAnimation.beginTime = 1.8
        biggerAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        biggerAnimation.fillMode = kCAFillModeForwards
        biggerAnimation.removedOnCompletion = false
        
        let smallAnimation = CABasicAnimation(keyPath: "bounds.size")
        smallAnimation.fromValue = NSValue(CGSize: CGSizeMake(50, 5))
        smallAnimation.toValue = NSValue(CGSize: CGSizeMake(0, 0))
        smallAnimation.duration = 0.2
        smallAnimation.beginTime = 2.5
        smallAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        smallAnimation.fillMode = kCAFillModeForwards
        smallAnimation.removedOnCompletion = false
        
        let leftAnimation = CABasicAnimation(keyPath: "position")
        leftAnimation.fromValue = NSValue(CGPoint: CGPointMake(25, 50))
        leftAnimation.toValue = NSValue(CGPoint: CGPointMake(50, 50))
        leftAnimation.duration = 0.2
        leftAnimation.beginTime = 2.5
        leftAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        leftAnimation.fillMode = kCAFillModeForwards
        leftAnimation.removedOnCompletion = false
        
        //组合动画
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [biggerAnimation, smallAnimation, leftAnimation]
        groupAnimation.repeatCount = Float.infinity // 无限重复动画
        groupAnimation.duration = 3
        lineLayer.addAnimation(groupAnimation, forKey: "looping")
    }
    
    func animation3(view: UIView) {
        let lineLayer = CAShapeLayer()
        lineLayer.frame = CGRectMake(50, 50, 0, 0)
        lineLayer.backgroundColor = UIColor.redColor().CGColor
        view.layer.addSublayer(lineLayer)
        
        let biggerAnimation = CABasicAnimation(keyPath: "bounds.size")
        biggerAnimation.fromValue = NSValue(CGSize: CGSizeMake(0, 0))
        biggerAnimation.toValue = NSValue(CGSize: CGSizeMake(15, 15))
        biggerAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        biggerAnimation.fillMode = kCAFillModeForwards
        biggerAnimation.duration = 2
        biggerAnimation.removedOnCompletion = false
        
        let smallAnimation = CABasicAnimation(keyPath: "bounds.size")
        smallAnimation.fromValue = NSValue(CGSize: CGSizeMake(15, 15))
        smallAnimation.toValue = NSValue(CGSize: CGSizeMake(0, 0))
        smallAnimation.beginTime = 2.7
        smallAnimation.duration = 0.3
        smallAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        smallAnimation.fillMode = kCAFillModeForwards
        smallAnimation.removedOnCompletion = false
        
        //组合动画
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [biggerAnimation, smallAnimation]
        groupAnimation.repeatCount = Float.infinity // 无限重复动画
        groupAnimation.duration = 3
        
        lineLayer.addAnimation(groupAnimation, forKey: "looping")
    }
}
