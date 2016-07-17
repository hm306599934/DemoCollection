//
//  CanvasModel.swift
//  DemoCollection
//
//  Created by Jimmy on 2/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

@objc protocol HMMark: NSObjectProtocol {
    
    func draw(context: CGContextRef)
}

class HMDraw: NSObject, HMMark {
    
    func draw(context: CGContextRef) {
    
    }
}

class HMDot: HMDraw {
    var frame: CGRect
    var color: UIColor
    
    init(frame: CGRect, color: UIColor) {
        self.frame = frame
        self.color = color
    }
    
    override func draw(context: CGContextRef) {
        CGContextSetFillColorWithColor(context, self.color.CGColor)
        CGContextFillEllipseInRect(context, self.frame)
    }
}

class HMStroke: HMDraw {
    var color: UIColor
    var location: CGPoint
    var bezierPath: UIBezierPath
    
    init(location: CGPoint,color: UIColor) {
        self.location = location
        self.color = color
        self.bezierPath = UIBezierPath()
        self.bezierPath.lineCapStyle = .Round
        self.bezierPath.lineJoinStyle = .Round
        self.bezierPath.lineWidth = 1
        self.bezierPath.moveToPoint(location)
    }
    
    override func draw(context: CGContextRef) {
        CGContextMoveToPoint(context, self.location.x, self.location.y)
        CGContextSetStrokeColorWithColor(context, self.color.CGColor)
        self.bezierPath.stroke()
    }
}

class HMLine: HMDraw {
    
    var color: CGColor
    var location: CGPoint
    var bezierPath: UIBezierPath
    
    init(location: CGPoint,color: CGColor) {
        self.location = location
        self.color = color
        self.bezierPath = UIBezierPath()
        self.bezierPath.lineCapStyle = .Round
        self.bezierPath.lineJoinStyle = .Round
        self.bezierPath.lineWidth = 10
        self.bezierPath.moveToPoint(location)
    }
    
    override func draw(context: CGContextRef) {
        CGContextMoveToPoint(context, self.location.x, self.location.y)
        CGContextSetStrokeColorWithColor(context, self.color)
        self.bezierPath.stroke()
    }
}