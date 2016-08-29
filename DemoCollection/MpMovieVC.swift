//
//  MpMovieVC.swift
//  DemoCollection
//
//  Created by Jimmy on 29/8/2016.
//  Copyright © 2016 浙江大华. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class MpMovieVC: UIViewController {
    
    var player: MPMoviePlayerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path: String = NSBundle.mainBundle().pathForResource("1.mp4", ofType: nil)!
        let url = NSURL(string: "http://dvlalioss.lechange.cn/LCL/1G0017BPAU00189/0/0/20160827153836/dev_20160827153836_m9kr63l6kpke8d90.m3u8")
        player = MPMoviePlayerController(contentURL: url)
        player?.view.frame = self.view.frame
        player?.play()
        
        self.view.addSubview(player!.view)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MpMovieVC.test), name: MPMoviePlayerPlaybackDidFinishNotification, object: nil)
    }
    
    func test() {
        print("lalala")
    }
}
