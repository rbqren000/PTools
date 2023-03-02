//
//  DispatchQueue+PTEX.swift
//  PooTools_Example
//
//  Created by 邓杰豪 on 2/3/23.
//  Copyright © 2023 crazypoo. All rights reserved.
//

import UIKit

extension DispatchQueue: PTProtocolCompatible {}

public extension PTProtocol where Base == DispatchQueue {
    private static var _onceTracker = [String]()
    
    // MARK: 函数只被执行一次
    /// 函数只被执行一次
    /// - Parameters:
    ///   - token: 函数标识
    ///   - block: 执行的闭包
    /// - Returns: 一次性函数
    static func once(token: String, block: () -> ()) {
        if _onceTracker.contains(token) {
            return
        }
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        _onceTracker.append(token)
        block()
    }
}
