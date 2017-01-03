//
//  File.swift
//  Working
//
//  Created by 张银龙 on 2017/1/3.
//  Copyright © 2017年 yinlong. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     - parameter token: 使用字符串token作为once的ID，执行once的时候加了一个锁，避免多线程下的token判断不准确的问题
     - parameter block: 执行一次 的闭包
     From: http://stackoverflow.com/questions/37886994/dispatch-once-in-swift-3
     */
    public class func once(token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}
