//
//  StreamingProgressBar.swift
//
//  Created by Kyle Zaragoza on 9/16/15.
//  Copyright © 2015 Kyle Zaragoza. All rights reserved.
//

import UIKit

@IBDesignable public class StreamingProgressBar: UIView {
    
    @IBInspectable public var progressBarColor: UIColor = UIColor.whiteColor() {
        didSet {
            progressBarLayer.backgroundColor = progressBarColor.CGColor
        }
    }
    
    @IBInspectable public var secondaryProgressBarColor: UIColor = UIColor.clearColor() {
        didSet {
            secondaryProgressBarLayer.backgroundColor = secondaryProgressBarColor.CGColor
        }
    }
    
    @IBInspectable public var secondaryProgress: CGFloat = 0 {
        didSet {
            if secondaryProgress > 1 {
                secondaryProgress = 1
            } else if secondaryProgress < 0 {
                secondaryProgress = 0
            }
            layout(secondaryProgressBarLayer, forProgress: secondaryProgress)
        }
    }

    @IBInspectable public var progress: CGFloat = 0.5 {
        didSet {
            if progress > 1 {
                progress = 1
            } else if progress < 0 {
                progress = 0
            }
            layout(progressBarLayer, forProgress: progress)
        }
    }
    
    private let progressBarLayer: CALayer = {
        let layer = CALayer()
        return layer
    }()
    
    private let secondaryProgressBarLayer: CALayer = {
        let layer = CALayer()
        return layer
    }()
    
    
    // MARK: - Layout
    
    private func layout(layer: CALayer, forProgress progress: CGFloat) {
        let layerFrame = CGRect(
            origin: CGPoint.zero,
            size: CGSize(width: self.bounds.width * progress, height: self.bounds.height))
        layer.frame = layerFrame
    }
    
    
    // MARK: - Init
    
    private func commonInit() {
        self.layer.addSublayer(secondaryProgressBarLayer)
        self.layer.addSublayer(progressBarLayer)
        layoutProgressBars()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    // MARK: - Layout
    
    private func layoutProgressBars() {
        layout(secondaryProgressBarLayer, forProgress: secondaryProgress)
        layout(progressBarLayer,          forProgress: progress)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layoutProgressBars()
    }
}
