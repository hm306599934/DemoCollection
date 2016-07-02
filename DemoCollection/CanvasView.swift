//
//  CanvasView.swift
//  DemoCollection
//
//  Created by Jimmy on 2/7/2016.
//  Copyright © 2016 浙江大华. All rights reserved.
//

import UIKit




class CanvasView: UIView {

    var paths: [HMStroke] = []
    
    
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
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    
    
}
