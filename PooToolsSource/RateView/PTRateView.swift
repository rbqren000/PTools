//
//  PTRateView.swift
//  PooTools_Example
//
//  Created by jax on 2022/8/29.
//  Copyright © 2022 crazypoo. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

public typealias PTRateScoreBlock = (_ score:CGFloat) -> Void

let PTRateBackgroundViewTags = 4567
let PTRateForegroundViewTags = 7654

@objcMembers
public class PTRateConfig: NSObject {
    ///默认得分范围0~1默认1
    public var scorePercent : CGFloat = 1 {
        didSet {
            if scorePercent > 1 {
                scorePercent = 1
            } else if scorePercent < 0 {
                scorePercent = 0
            }
        }
    }
    ///展示的数量,默认5个
    public var numberOfStar : Int = 5
    ///已经选择的图片
    public var fImage:UIImage = "🌟".emojiToImage(emojiFont: .appfont(size: 24))
    ///未选择的图片
    public var bImage:UIImage = "⭐️".emojiToImage(emojiFont: .appfont(size: 24))
    ///是否可以点击
    public var canTap:Bool = false
    ///是否有动画
    public var hadAnimation:Bool = false
    ///是否显示全星
    public var allowIncompleteStar:Bool = false
}

@objcMembers
public class PTRateView: UIView {
    public var rateBlock:PTRateScoreBlock?
    
    public var viewConfig:PTRateConfig? {
        didSet {
            scorePercent = viewConfig!.scorePercent
            removeSubviews()
            loaded = false
            layoutSubviews()
        }
    }
    fileprivate lazy var backgroundStarView:UIView = createStartView(image: viewConfig!.bImage, tag: PTRateBackgroundViewTags)
    fileprivate lazy var foregroundStarView:UIView = createStartView(image: viewConfig!.fImage, tag: PTRateForegroundViewTags)

    fileprivate var scorePercent:CGFloat? = 0 {
        didSet {
            PTGCDManager.gcdAfter(time: 0.1) {
                self.layoutSubviews()
            }
            
            if rateBlock != nil {
                rateBlock!(scorePercent!)
            }
        }
    }
    
    fileprivate var loaded:Bool = false
    
    public init(viewConfig:PTRateConfig) {
        super.init(frame: .zero)
        self.viewConfig = viewConfig
        
        if self.viewConfig!.canTap {
            let tapGes = UITapGestureRecognizer.init { sender in
                let ges = sender as! UITapGestureRecognizer
                let tapPoint = ges.location(in: self)
                let offSet = tapPoint.x
                let realStartScore = offSet / (self.frame.size.width / CGFloat(self.viewConfig!.numberOfStar))
                let starScore = self.viewConfig!.allowIncompleteStar ? Float(realStartScore) : ceilf(Float(realStartScore))
                self.scorePercent = CGFloat(starScore) / CGFloat(self.viewConfig!.numberOfStar)
                self.foregroundStarView.snp.updateConstraints({ make in
                    make.width.equalTo(self.frame.size.width * self.scorePercent!)
                })
            }
            tapGes.numberOfTapsRequired = 1
            addGestureRecognizer(tapGes)
        }
    }
    
    func initView() {
        PTGCDManager.gcdAfter(time: 0.1) {
            
            self.scorePercent = self.viewConfig!.scorePercent
            self.addSubviews([self.backgroundStarView,self.foregroundStarView])

            self.backgroundStarView.snp.makeConstraints({ make in
                make.edges.equalToSuperview()
            })
            
            self.foregroundStarView.snp.makeConstraints({ make in
                make.top.bottom.equalToSuperview()
                make.left.equalToSuperview()
                make.width.equalTo(0)
            })
            
            let animationTimeInterval = self.viewConfig!.hadAnimation ? 0.2 : 0
            UIView.animate(withDuration: animationTimeInterval) {
                self.foregroundStarView.snp.updateConstraints({ make in
                    make.width.equalTo(self.frame.size.width * self.scorePercent!)
                })
            }
            
            self.loaded = true
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if !loaded {
            initView()
        }
    }
    
    fileprivate func createStartView(image:UIImage,tag:Int) ->UIView {
        let contentV = UIView()
        contentV.clipsToBounds = true
        contentV.backgroundColor = .clear
        
        for i in 0..<viewConfig!.numberOfStar {
            let imageV = UIImageView(image: image)
            imageV.contentMode = .scaleAspectFit
            imageV.tag = tag + i
            contentV.addSubview(imageV)
            imageV.snp.makeConstraints { make in
                make.left.equalToSuperview().inset(CGFloat(i) * self.frame.size.width / CGFloat(self.viewConfig!.numberOfStar))
                make.top.bottom.equalToSuperview()
                make.width.equalTo(self.frame.size.width / CGFloat(self.viewConfig!.numberOfStar))
            }
        }
        return contentV
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
