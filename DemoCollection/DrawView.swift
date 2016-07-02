//
//  DrawView.swift
//  DemoCollection
//
//  Created by Jimmy on 17/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = min(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
let SCREEN_HEIGHT = max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)

class DrawView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func drawRect(rect: CGRect) {
        let contextRef = UIGraphicsGetCurrentContext()
        
        //画线
        let linePoints = [CGPointMake(0, 0), CGPointMake(320, 0)]
        CGContextAddLines(contextRef, linePoints, linePoints.count)
        CGContextSetLineWidth(contextRef, 1.0)
        CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor)
        CGContextDrawPath(contextRef, .Stroke)
        
        //画框
        var x: CGFloat = 0
        var y: CGFloat = 0
        var width: CGFloat = SCREEN_WIDTH
        var height: CGFloat = 120
        
        while width >= 10 && height >= 10 {
            x = x + 10
            y = y + 10
            width = SCREEN_WIDTH - x * 2
            height = 120 - x * 2
            CGContextAddRect(contextRef, CGRectMake(x, y, width, height))
            CGContextSetLineWidth(contextRef, 2.0)
            CGContextSetStrokeColorWithColor(contextRef, UIColor.purpleColor().CGColor);
            CGContextDrawPath(contextRef, .Stroke);
        }
        
        //
        
    }

}
