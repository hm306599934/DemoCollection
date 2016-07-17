//
//  BezierPathView.swift
//  DemoCollection
//
//  Created by Jimmy on 6/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

class BezierPathView: UIView {
    
    var percent: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        percent = 0
    }
    
    override func drawRect(rect: CGRect) {
        
        var color = UIColor.redColor()
        color.set()
        
        var bezierPath = UIBezierPath(rect: CGRectMake(10, 10, 50, 50))
        //线条拐角
        bezierPath.lineCapStyle = .Round
        //终点处理
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 2
        bezierPath.stroke()
        
        bezierPath = UIBezierPath(ovalInRect: CGRectMake(70, 10, 80, 50))
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 3
        bezierPath.stroke()
        
        bezierPath = UIBezierPath(ovalInRect: CGRectMake(180, 10, 50, 50))
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 3
        bezierPath.stroke()
        
        color = UIColor.purpleColor()
        color.setFill()
        color = UIColor.greenColor()
        color.setStroke()
        
        bezierPath = UIBezierPath()
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 3
        bezierPath.moveToPoint(CGPointMake(10, 100))
        bezierPath.addLineToPoint(CGPointMake(50, 150))
        bezierPath.addLineToPoint(CGPointMake(30, 150))
        bezierPath.stroke()

        bezierPath.moveToPoint(CGPointMake(80, 100))
        bezierPath.addLineToPoint(CGPointMake(120, 150))
        bezierPath.addLineToPoint(CGPointMake(100, 150))
        bezierPath.stroke()
        bezierPath.fill()

        bezierPath.moveToPoint(CGPointMake(150, 100))
        bezierPath.addLineToPoint(CGPointMake(190, 150))
        bezierPath.addLineToPoint(CGPointMake(170, 150))
        bezierPath.addLineToPoint(CGPointMake(150, 100))
        bezierPath.stroke()
        
        bezierPath.moveToPoint(CGPointMake(220, 100))
        bezierPath.addLineToPoint(CGPointMake(260, 150))
        bezierPath.addLineToPoint(CGPointMake(240, 150))
        bezierPath.addLineToPoint(CGPointMake(220, 100))
        bezierPath.stroke()
        bezierPath.fill()
        
        color = UIColor.blueColor()
        color.set()
        
        bezierPath = UIBezierPath()
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 3
        bezierPath.moveToPoint(CGPointMake(10, 250))
        bezierPath.addQuadCurveToPoint(CGPointMake(110, 250), controlPoint: CGPointMake(60, 200))
        bezierPath.addQuadCurveToPoint(CGPointMake(210, 250), controlPoint: CGPointMake(160, 300))
        bezierPath.addQuadCurveToPoint(CGPointMake(310, 250), controlPoint: CGPointMake(280, 200))
        bezierPath.stroke()
        
        color = UIColor.greenColor()
        color.set()
        
        bezierPath = UIBezierPath(arcCenter: CGPointMake(50, 330), radius: 30, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI_2 - 1), clockwise: true)
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 3
        bezierPath.stroke()
        
        
        bezierPath = UIBezierPath(arcCenter: CGPointMake(140, 330), radius: 30, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(2 * M_PI) * percent - CGFloat(M_PI_2), clockwise: true)
        bezierPath.lineCapStyle = .Butt
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 10
        bezierPath.stroke()
        
        
        bezierPath = UIBezierPath()
        bezierPath.lineCapStyle = .Square
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 5
        bezierPath.moveToPoint(CGPointMake(220, 330))
        switch percent {
        case _ where percent <= 0.25:
             bezierPath.addLineToPoint(CGPointMake(220 + CGFloat(80) * percent, 330))
        case _ where percent <= 0.5:
            bezierPath.addLineToPoint(CGPointMake(240, 330))
            bezierPath.moveToPoint(CGPointMake(240, 330))
            bezierPath.addLineToPoint(CGPointMake(240, 330 + CGFloat(80) * (percent - 0.25)))
        case _ where percent <= 0.75:
            bezierPath.addLineToPoint(CGPointMake(240, 330))
            bezierPath.addLineToPoint(CGPointMake(240, 350))
            bezierPath.moveToPoint(CGPointMake(240, 350))
            bezierPath.addLineToPoint(CGPointMake(240 - CGFloat(80) * (percent - 0.5), 350))
        case _ where percent <= 1.0:
            bezierPath.addLineToPoint(CGPointMake(240, 330))
            bezierPath.addLineToPoint(CGPointMake(240, 350))
            bezierPath.addLineToPoint(CGPointMake(220, 350))
            bezierPath.moveToPoint(CGPointMake(220, 350))
            bezierPath.addLineToPoint(CGPointMake(220, 350 - CGFloat(80) * (percent - 0.75)))
        default:
            break
        }
       
        //bezierPath.addLineToPoint(CGPointMake(300, 330))
        
        bezierPath.stroke()
        
        
        color = UIColor.orangeColor()
        color.set()
        
        bezierPath = UIBezierPath()
        bezierPath.lineCapStyle = .Round
        bezierPath.lineJoinStyle = .Round
        bezierPath.lineWidth = 3
        bezierPath.addArcWithCenter(CGPointMake(160, 400), radius: 30, startAngle: CGFloat(-M_PI), endAngle: 0, clockwise: true)
        bezierPath.addArcWithCenter(CGPointMake(190, 430), radius: 30, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI_2), clockwise: true)
        bezierPath.addArcWithCenter(CGPointMake(160, 460), radius: 30, startAngle:0, endAngle: CGFloat(M_PI), clockwise: true)
        bezierPath.addArcWithCenter(CGPointMake(130, 430), radius: 30, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(-M_PI_2), clockwise: true)
        bezierPath.fill()
        
    }
    
}