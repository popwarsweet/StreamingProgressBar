//
//  ViewController.swift
//  StreamingProgressBar
//
//  Created by Kyle Zaragoza on 08/23/2016.
//  Copyright (c) 2016 Kyle Zaragoza. All rights reserved.
//

import UIKit
import StreamingProgressBar

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: StreamingProgressBar!
    var playTimer: NSTimer?
    var bufferTimer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playTimer = NSTimer.scheduledTimerWithTimeInterval(
            1/30,
            target: self,
            selector: #selector(incrementPlayTimer),
            userInfo: nil,
            repeats: true)
        bufferTimer = NSTimer.scheduledTimerWithTimeInterval(
            0.5,
            target: self,
            selector: #selector(incrementBufferProgress),
            userInfo: nil,
            repeats: true)
    }
    
    func incrementPlayTimer() {
        let updatedProgress = progressBar.progress + 0.002
        if updatedProgress > 1 {
            progressBar.progress = 0
            progressBar.secondaryProgress = 0
        } else {
            progressBar.progress = updatedProgress
        }
    }
    
    func incrementBufferProgress() {
        progressBar.secondaryProgress += 0.1
    }
}

