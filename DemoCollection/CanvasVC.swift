//
//  CanvasVC.swift
//  DemoCollection
//
//  Created by Jimmy on 12/6/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit

class CanvasVC: UIViewController {
    
    @IBOutlet weak var canvasView: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func deleteAction(sender: UIButton) {
    
    }

    @IBAction func downloadAction(sender: UIButton) {
        
    }
    
    @IBAction func uploadAction(sender: UIButton) {
    
    }
    
    @IBAction func setAction(sender: UIButton) {
        let setView = CanvasSetView(frame: self.view.frame)
        self.view.addSubview(setView)
        setView.show()
    }
    
    @IBAction func frontAction(sender: UIButton) {
    
    }
    
    @IBAction func backAction(sender: UIButton) {
   
    }
    
    
}
