//
//  UIWindow.Extension.swift
//  QR5
//
//  Created by Ghost on 2023/2/27.
//


import UIKit

extension UIWindow {
    static public func mainWindow() -> UIWindow? {
        if #available(iOS 15.0, *) {
            for scene in UIApplication.shared.connectedScenes {
                if scene.activationState == .foregroundActive {
                    if let windowScene = scene as? UIWindowScene, (windowScene.keyWindow != nil) {
                        return windowScene.keyWindow
                    }
                }
            }
        }
        for window in UIApplication.shared.windows {
            if window.isKeyWindow {
                return window
            }
        }
        return nil
    }
    
    static public func currentVC() -> UIViewController? {
        guard let mainWindow = mainWindow() else {
            return nil
        }
        var topVC = mainWindow.rootViewController
        while (topVC?.presentedViewController != nil) {
            topVC = topVC?.presentedViewController
        }
        while (topVC?.isKind(of: UITabBarController.self) ?? false && (topVC as? UITabBarController)?.selectedViewController != nil) {
            topVC = (topVC as? UITabBarController)?.selectedViewController
        }
        while (topVC?.isKind(of: UINavigationController.self) ?? false && (topVC as? UINavigationController)?.topViewController != nil) {
            topVC = (topVC as? UINavigationController)?.topViewController
        }
        return topVC;
    }

}
