//
//  GraphicView.swift
//  DemoCollection
//
//  Created by Jimmy on 7/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit


class GraphicView: UIView {
    
    
    
    override func drawRect(rect: CGRect) {
       
        let contextRef = UIGraphicsGetCurrentContext()
        //画线
        var linePoints = [CGPoint]()
        for i in 1...30 {
            linePoints.append(CGPointMake(CGFloat(20 * i), 30 + CGFloat((i % 2 == 0 ? -1 : 1)) * 10))
        }
        
        CGContextAddLines(contextRef, linePoints, linePoints.count)
        CGContextSetLineWidth(contextRef, 1.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextDrawPath(contextRef, .Stroke)
        
        //画矩形
        var x: CGFloat = 0
        var y: CGFloat = 50
        var width: CGFloat = SCREEN_WIDTH
        var height: CGFloat = 120
        
        while width >= 10 && height >= 10 {
            x = x + 10
            y = y + 10
            width = SCREEN_WIDTH - x * 2
            height = 120 - x * 2
            CGContextAddRect(contextRef, CGRectMake(x, y, width, height))
            CGContextSetLineWidth(contextRef, 2.0)
            CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
            CGContextDrawPath(contextRef, .Stroke);
        }
        
        CGContextAddRect(contextRef, CGRectMake(20, 200, 40, 20))
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextSetFillColorWithColor(contextRef, UIColor.redColor().CGColor)
        CGContextDrawPath(contextRef, .Stroke)
        
        CGContextAddRect(contextRef, CGRectMake(80, 200, 40, 20))
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextSetFillColorWithColor(contextRef, UIColor.redColor().CGColor)
        CGContextDrawPath(contextRef, .EOFill)
        
        CGContextAddRect(contextRef, CGRectMake(140, 200, 40, 20))
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextSetFillColorWithColor(contextRef, UIColor.redColor().CGColor)
        CGContextDrawPath(contextRef, .Fill)
        
        CGContextAddRect(contextRef, CGRectMake(200, 200, 40, 20))
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextSetFillColorWithColor(contextRef, UIColor.redColor().CGColor)
        CGContextDrawPath(contextRef, .EOFillStroke)
    
        CGContextAddRect(contextRef, CGRectMake(260, 200, 40, 20))
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextSetFillColorWithColor(contextRef, UIColor.redColor().CGColor)
        CGContextDrawPath(contextRef, .FillStroke)
        
        //画圆
        CGContextAddArc(contextRef, 30, 260, 20, CGFloat(-M_PI_2), CGFloat(M_PI_2), 0)
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextDrawPath(contextRef, .Stroke)
        
        CGContextAddArc(contextRef, 120, 260, 20, CGFloat(-M_PI_2), CGFloat(M_PI_2), 1)
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextDrawPath(contextRef, .FillStroke)
        
        CGContextAddArc(contextRef, 180, 260, 20, CGFloat(-M_PI_2), CGFloat(M_PI_2), 1)
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextDrawPath(contextRef, .Stroke)
        
        CGContextAddArc(contextRef, 180, 260, 20, CGFloat(-M_PI_2), CGFloat(M_PI_2), 1)
        CGContextSetLineWidth(contextRef, 10.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextDrawPath(contextRef, .Fill)
        
        let path =  UIBezierPath(arcCenter: CGPointMake(230, 260), radius: 20, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(M_PI_2), clockwise: true).CGPath
        CGContextAddPath(contextRef, path)
        CGContextDrawPath(contextRef, .Stroke)
    }
    
}
