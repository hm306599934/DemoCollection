//
//  CanvasModel.swift
//  DemoCollection
//
//  Created by Jimmy on 2/7/2016.
//  Copyright © 2016 浙江大华. All rights reserved.
//

import UIKit

protocol HMMark: NSObjectProtocol {
    var color: CGColor { get }
    var frame: CGRect { get }
    
    func draw(context: CGContextRef)
}

class HMDot: NSObject {
    var color: CGColor
    var frame: CGRect
    
    init(frame: CGRect, color: CGColor) {
        self.frame = frame
        self.color = color
    }
    
    func draw(context: CGContextRef) {
        CGContextSetFillColorWithColor(context, self.color)
        CGContextFillEllipseInRect(context, self.frame)
    }
}

class HMStroke: NSObject {
   
    var color: CGColor
    var location: CGPoint
    var bezierPath: UIBezierPath
    
    init(location: CGPoint, bezierPath: UIBezierPath,color: CGColor) {
        self.location = location
        self.color = color
        self.bezierPath = bezierPath
    }
    
    func draw(context: CGContextRef) {
        CGContextMoveToPoint(context, self.location.x, self.location.y)
        
        
    }
}