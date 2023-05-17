//
//  GHConstant.swift
//  gh_base
//
//  Created by Ghost on 2023/5/17.
//

import Foundation

// MARK: - 常用
typealias GPVoidBlock = () ->()
typealias GPBoolBlock = (Bool) ->()
typealias GPFloatBlock = (Float) ->()
typealias GPIntBlock = (Int) ->()
typealias GPStringBlock = (String?) ->()
typealias GPImageBlock = (UIImage?) ->()
typealias GPDataBlock = (Data?) ->()
typealias GPErrorBlock = (Error?) ->()
typealias GPArrayBlock = ([Any]?) ->()
typealias GPAnyBlock = (Any?) ->()

let kScreenHeight = UIScreen.main.bounds.height
let kScreenWidth  = UIScreen.main.bounds.width

let kDefaultDesignWidth = 375.0
let kDefaultDesignHeight = 741.0

let kDefaultWidthScale = kScreenWidth / kDefaultDesignWidth
let kDefaultHeightScale = kScreenHeight / kDefaultDesignHeight

let kSafeAreaTopHeight = kScreenHeight >= 812.0 ? 88.0 : 64.0
let kSafeTopHeight = kScreenHeight >= 812.0 ? 44.0 : 20.0
let kSafeAreaBottomHeight: CGFloat = kScreenHeight >= 812.0 ? 24.0 : 0.0

func scaleWidth(_ value: CGFloat, _ designWidth: CGFloat = kDefaultDesignWidth) -> CGFloat {
    return kScreenWidth / designWidth * value
}

func scaleHeight(_ value: CGFloat, _ designHeight: CGFloat = kDefaultDesignHeight) -> CGFloat {
    return kScreenHeight / designHeight * value
}

func asyncMainThread(_ block:@escaping () ->()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.async(execute: block)
    }
}
