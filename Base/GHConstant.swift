//
//  GHConstant.swift
//  gh_base
//
//  Created by Ghost on 2023/5/17.
//

import Foundation

// MARK: - 常用
public typealias GHVoidBlock = () ->()
public typealias GHBoolBlock = (Bool) ->()
public typealias GHFloatBlock = (Float) ->()
public typealias GHIntBlock = (Int) ->()
public typealias GHStringBlock = (String?) ->()
public typealias GHImageBlock = (UIImage?) ->()
public typealias GHDataBlock = (Data?) ->()
public typealias GHErrorBlock = (Error?) ->()
public typealias GHArrayBlock = ([Any]?) ->()
public typealias GHAnyBlock = (Any?) ->()

public let kScreenHeight = UIScreen.main.bounds.height
public let kScreenWidth  = UIScreen.main.bounds.width

public let kDefaultDesignWidth = 375.0
public let kDefaultDesignHeight = 741.0

public let kDefaultWidthScale = kScreenWidth / kDefaultDesignWidth
public let kDefaultHeightScale = kScreenHeight / kDefaultDesignHeight

public let kSafeAreaTopHeight = kScreenHeight >= 812.0 ? 88.0 : 64.0
public let kSafeTopHeight = kScreenHeight >= 812.0 ? 44.0 : 20.0
public let kSafeAreaBottomHeight: CGFloat = kScreenHeight >= 812.0 ? 24.0 : 0.0

public func scaleWidth(_ value: CGFloat, _ designWidth: CGFloat = kDefaultDesignWidth) -> CGFloat {
    return kScreenWidth / designWidth * value
}

public func scaleHeight(_ value: CGFloat, _ designHeight: CGFloat = kDefaultDesignHeight) -> CGFloat {
    return kScreenHeight / designHeight * value
}

public func asyncMainThread(_ block:@escaping () ->()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.async(execute: block)
    }
}
