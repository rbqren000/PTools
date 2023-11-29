//
//  PTAdjustSliderView.swift
//  PooTools_Example
//
//  Created by 邓杰豪 on 29/11/23.
//  Copyright © 2023 crazypoo. All rights reserved.
//

import UIKit

class PTAdjustSliderView: UIView {

    static let maximumValue: Float = 1
    
    static let minimumValue: Float = -1
    
    let sliderWidth: CGFloat = 5
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowOpacity = 1
        label.textColor = .white
        label.textAlignment = PTMediaLibUIConfig.share.adjustSliderType == .vertical ? .right : .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        return label
    }()
    
    lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .white.lighter(amount: 0.8)
        return view
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.layer.cornerRadius = sliderWidth / 2
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 3
        return view
    }()
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = sliderWidth / 2
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var tintView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    lazy var pan = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
    
    private var impactFeedback: UIImpactFeedbackGenerator?
    
    private var valueForPanBegan: Float = 0
    
    var value: Float = 0 {
        didSet {
            valueLabel.text = String(Int(roundf(value * 100)))
            tintView.frame = calculateTintFrame()
        }
    }
    
    private var isVertical = PTMediaLibUIConfig.share.adjustSliderType == .vertical
    
    var beginAdjust: (() -> Void)?
    
    var valueChanged: ((Float) -> Void)?
    
    var endAdjust: (() -> Void)?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
//        let editConfig = ZLPhotoConfiguration.default().editImageConfiguration
//        if editConfig.impactFeedbackWhenAdjustSliderValueIsZero {
//            impactFeedback = UIImpactFeedbackGenerator(style: editConfig.impactFeedbackStyle)
//        }
        
        addGestureRecognizer(pan)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if isVertical {
            shadowView.frame = CGRect(x: 40, y: 0, width: sliderWidth, height: bounds.height)
            whiteView.frame = shadowView.frame
            tintView.frame = calculateTintFrame()
            let separatorH: CGFloat = 1
            separator.frame = CGRect(x: 0, y: (bounds.height - separatorH) / 2, width: sliderWidth, height: separatorH)
            valueLabel.frame = CGRect(x: 0, y: bounds.height / 2 - 10, width: 38, height: 20)
        } else {
            valueLabel.frame = CGRect(x: 0, y: 0, width: pt.jx_width, height: 38)
            shadowView.frame = CGRect(x: 0, y: valueLabel.pt.maxY + 2, width: pt.jx_width, height: sliderWidth)
            whiteView.frame = shadowView.frame
            tintView.frame = calculateTintFrame()
            let separatorW: CGFloat = 1
            separator.frame = CGRect(x: (pt.jx_width - separatorW) / 2, y: 0, width: separatorW, height: sliderWidth)
        }
    }
    
    private func setupUI() {
        addSubview(shadowView)
        addSubview(whiteView)
        whiteView.addSubview(tintView)
        whiteView.addSubview(separator)
        addSubview(valueLabel)
    }
    
    private func calculateTintFrame() -> CGRect {
        if isVertical {
            let totalH = pt.jx_height / 2
            let tintH = totalH * abs(CGFloat(value)) / CGFloat(PTAdjustSliderView.maximumValue)
            if value > 0 {
                return CGRect(x: 0, y: totalH - tintH, width: sliderWidth, height: tintH)
            } else {
                return CGRect(x: 0, y: totalH, width: sliderWidth, height: tintH)
            }
        } else {
            let totalW = pt.jx_width / 2
            let tintW = totalW * abs(CGFloat(value)) / CGFloat(PTAdjustSliderView.maximumValue)
            if value > 0 {
                return CGRect(x: totalW, y: 0, width: tintW, height: sliderWidth)
            } else {
                return CGRect(x: totalW - tintW, y: 0, width: tintW, height: sliderWidth)
            }
        }
    }
    
    @objc private func panAction(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: self)
        
        if pan.state == .began {
            valueForPanBegan = value
            beginAdjust?()
            impactFeedback?.prepare()
        } else if pan.state == .changed {
            let transValue = isVertical ? -translation.y : translation.x
            let totalLength = isVertical ? pt.jx_height / 2 : pt.jx_width / 2
            var temp = valueForPanBegan + Float(transValue / totalLength)
            temp = max(PTAdjustSliderView.minimumValue, min(PTAdjustSliderView.maximumValue, temp))
            
            if (-0.0049..<0.005) ~= temp {
                temp = 0
            }
            
            guard value != temp else { return }
            
            value = temp
            valueChanged?(value)
            
            guard #available(iOS 10.0, *) else { return }
            if value == 0 {
                impactFeedback?.impactOccurred()
            }
        } else {
            valueForPanBegan = value
            endAdjust?()
        }
    }

}
