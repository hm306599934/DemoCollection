//
//  MpMovieVC.swift
//  DemoCollection
//
//  Created by Jimmy on 29/8/2016.
//  Copyright © 2016 Tony. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class MpMovieVC: UIViewController {
    
    var player: MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path: String = NSBundle.mainBundle().pathForResource("1.mp4", ofType: nil)!
        let url = NSURL(string: "http://hzhls01.ys7.com:7886/hcnp/532245894_1_1_1_0_cas.ys7.com_6500.m3u8")
        player = MPMoviePlayerController(contentURL: url)
        player?.view.frame = self.view.frame
        player?.play()
        player?.controlStyle = .None
        player?.scalingMode = .AspectFit
        self.view.addSubview(player!.view)
        
        player!.view.snp_makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(200)
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MpMovieVC.test), name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
    }
    
    func test() {
        print("lalala")
    }
}
