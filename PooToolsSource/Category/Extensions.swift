//
//  Extensions.swift
//
//  Created by Duraid Abdul.
//  Copyright © 2021 Duraid Abdul. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    //MARK: 獲取屏幕的Size
    /// 獲取屏幕的Size
    static var size: CGSize {
        UIScreen.main.bounds.size
    }
    
    //MARK: 獲取豎屏的尺寸
    ///獲取豎屏的尺寸
    static var portraitSize: CGSize {
        CGSize(width: UIScreen.main.nativeBounds.width / UIScreen.main.nativeScale,
                height: UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale)
    }
    
    static var hasRoundedCorners = UIScreen.main.value(forKey: "_" + "display" + "Corner" + "Radius") as! CGFloat > 0
}

//TODO: 這裏還要歸好類
@available(iOSApplicationExtension, unavailable)
public extension UIApplication {
    var statusBarHeight: CGFloat {
        if let window = UIApplication.shared.windows.first {
            return window.safeAreaInsets.top
        } else {
            return 0
        }
    }
}

public extension UIFont {
    class func systemFont(ofSize size: CGFloat, weight: UIFont.Weight, design: UIFontDescriptor.SystemDesign) -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).addingAttributes([UIFontDescriptor.AttributeName.traits : [UIFontDescriptor.TraitKey.weight : weight]]).withDesign(design)
        
        return UIFont(descriptor: descriptor!, size: size)
    }
}

public extension UIControl {
    func addActions(highlightAction: UIAction, unhighlightAction: UIAction) {
        if #available(iOS 14.0, *) {
            addAction(highlightAction, for: .touchDown)
            addAction(highlightAction, for: .touchDragEnter)
            addAction(unhighlightAction, for: .touchUpInside)
            addAction(unhighlightAction, for: .touchDragExit)
            addAction(unhighlightAction, for: .touchCancel)
        }
    }
}

public extension UIView {
    func roundOriginToPixel() {
        frame.origin.x = (round(frame.origin.x * UIScreen.main.scale)) / UIScreen.main.scale
        frame.origin.y = (round(frame.origin.y * UIScreen.main.scale)) / UIScreen.main.scale
    }
}
