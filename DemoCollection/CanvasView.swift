//
//  CanvasView.swift
//  DemoCollection
//
//  Created by Jimmy on 2/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit


class CanvasView: UIView {

    var paths: [HMDraw] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let contextRef = UIGraphicsGetCurrentContext()
        
        for path in paths {
            path.draw(contextRef!)
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
//        if let touch = touches.first {
//            let location = touch.locationInView(self)
            
//            let color = UIColor.redColor().CGColor
//            let frame = CGRect(x: location.x, y: location.y, width: 10, height: 10)
//            let dot = HMDot(frame: frame, color: color)
//            self.paths.append(dot)
//            self.setNeedsDisplay()
//        }
        
        if let touch = touches.first {
            let location = touch.locationInView(self)
            
            let color = UIColor.redColor()
            let stroke = HMStroke(location: location, color: color)
            self.paths.append(stroke)
            self.setNeedsDisplay()
        }
        
//        if let touch = touches.first {
//            let location = touch.locationInView(self)
//            
//            let color = UIColor.redColor().CGColor
//            let line = HMLine(location: location, color: color)
//            self.paths.append(line)
//            self.setNeedsDisplay()
//        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let point = touches.first?.locationInView(self)
        
        if let line = self.paths.last as? HMLine {
            line.bezierPath = UIBezierPath()
            line.bezierPath.lineCapStyle = .Round
            line.bezierPath.lineJoinStyle = .Round
            line.bezierPath.lineWidth = 1
            line.bezierPath.moveToPoint(line.location)
            line.bezierPath.addLineToPoint(point!)
        } else if let stroke = self.paths.last as? HMStroke {
            
            stroke.bezierPath.addLineToPoint(point!)
        }
        
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    
    
}
