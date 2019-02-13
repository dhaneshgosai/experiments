//
//  ViewController.swift
//  SampleYoutubePlayerSwift
//
//  Created by Sheshnath on 12/02/19.
//  Copyright © 2019 Exp. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var playerView: YTPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        playerView.webView?.allowsInlineMediaPlayback = true
        
        let dictData : [AnyHashable : Any] = ["fs": 1, "controls" : 1, "playsinline" : 0, "autohide" : 1, "showinfo" : 1, "autoplay": 1, "modestbranding" : 1 ]
        playerView.load(withVideoId: "PQmrmVs10X8", playerVars: dictData)
    }


}

