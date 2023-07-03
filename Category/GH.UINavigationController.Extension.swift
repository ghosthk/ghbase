//
//  GH.UINavigationController.Extension.swift
//  Healthy2
//
//  Created by Ghost on 2023/6/19.
//

import Foundation

extension UINavigationController {
    
    /// 移除中间vc，保留第一个与最后一个
    public func removeCenterVCs() {
        if viewControllers.count > 2 {
            var vcs: [UIViewController] = []
            vcs.append(viewControllers.first!)
            vcs.append(viewControllers.last!)
            viewControllers = vcs
        }
    }
    
    /// 移除之前vc，只保留最后一个
    public func removeAllBeforeVCs() {
        if viewControllers.count > 1 {
            var vcs: [UIViewController] = []
            vcs.append(viewControllers.last!)
            viewControllers = vcs
        }
    }
}
