//
//  CanvasSetView.swift
//  DemoCollection
//
//  Created by Jimmy on 3/7/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

enum CanvasShape {
    case Stroke
    case Line
    case Round
    case Oval
    case Rect
}

class CanvasSetView: UIView {
    
    var mColor: UIColor!
    var mShape: CanvasShape!
    var mSize: CGFloat!
    
    @IBOutlet weak var contentView: UIView!
    
    private let kDuration = 0.5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        initialFromXib()
        initial()
    }
    
    func initialFromXib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CanvasSet", bundle: bundle)
        let thisView = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        thisView.frame = bounds
        thisView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(thisView)
    }
    
    func initial() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CanvasSetView.dismissView)))
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: nil))
        
        self.mColor = UIColor.blackColor()
        self.mShape = .Stroke
        self.mSize = 1
        
    }
    
    func dismissView() {
        let animation = CATransition()
        animation.delegate = self
        animation.duration = kDuration
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromBottom
        
        contentView.alpha = 0.0
        contentView.layer.addAnimation(animation, forKey: "CanvasSetView")
        
        UIView.animateWithDuration(kDuration, animations: { 
            self.backgroundColor = UIColor(white: 0.2, alpha: 0.0)
            },
            completion: { finished in
                self.removeFromSuperview()
        })
    }
    
    func show(){
        let animation = CATransition()
        animation.delegate = self
        animation.duration = kDuration
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromTop;
        
        contentView.alpha = 1.0
        contentView.layer.addAnimation(animation, forKey: "CanvasSetView")
        
        UIView.animateWithDuration(kDuration, animations: {
            self.backgroundColor = UIColor(white: 0.4, alpha: 0.5)
        })
    }
    
}