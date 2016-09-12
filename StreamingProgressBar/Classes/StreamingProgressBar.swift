//
//  StreamingProgressBar.swift
//
//  Created by Kyle Zaragoza on 9/16/15.
//  Copyright © 2015 Kyle Zaragoza. All rights reserved.
//

import UIKit

@IBDesignable open class StreamingProgressBar: UIView {
    
    @IBInspectable open var progressBarColor: UIColor = UIColor.white {
        didSet {
            progressBarLayer.backgroundColor = progressBarColor.cgColor
        }
    }
    
    @IBInspectable open var secondaryProgressBarColor: UIColor = UIColor.clear {
        didSet {
            secondaryProgressBarLayer.backgroundColor = secondaryProgressBarColor.cgColor
        }
    }
    
    @IBInspectable open var secondaryProgress: CGFloat = 0 {
        didSet {
            if secondaryProgress > 1 {
                secondaryProgress = 1
            } else if secondaryProgress < 0 {
                secondaryProgress = 0
            }
            layout(secondaryProgressBarLayer, forProgress: secondaryProgress)
        }
    }

    @IBInspectable open var progress: CGFloat = 0.5 {
        didSet {
            if progress > 1 {
                progress = 1
            } else if progress < 0 {
                progress = 0
            }
            layout(progressBarLayer, forProgress: progress)
        }
    }
    
    fileprivate let progressBarLayer: CALayer = {
        let layer = CALayer()
        return layer
    }()
    
    fileprivate let secondaryProgressBarLayer: CALayer = {
        let layer = CALayer()
        return layer
    }()
    
    
    // MARK: - Layout
    
    fileprivate func layout(_ layer: CALayer, forProgress progress: CGFloat) {
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
    
    fileprivate func layoutProgressBars() {
        layout(secondaryProgressBarLayer, forProgress: secondaryProgress)
        layout(progressBarLayer,          forProgress: progress)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutProgressBars()
    }
}
