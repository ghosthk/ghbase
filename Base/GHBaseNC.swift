//
//  GHBaseNC.swift
//
//  Created by Ghost on 2023/3/10.
//

import UIKit
import EachNavigationBar

open class GHBaseNC: UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigation.configuration.isEnabled = true
        navigation.configuration.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(hex: 0x1B2132) as Any,
            NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 18.0) as Any]
        navigation.configuration.isShadowHidden = true
//        navigation.configuration.alpha = 0.0
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return self.topViewController?.preferredInterfaceOrientationForPresentation ?? super.preferredInterfaceOrientationForPresentation
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        }
        return .default
    }
    
    open override var shouldAutorotate: Bool {
        return self.topViewController?.shouldAutorotate ?? super.shouldAutorotate
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if let nc = self.parent?.navigationController {
            nc.pushViewController(viewController, animated: animated)
        } else {
            super.pushViewController(viewController, animated: animated)
        }
    }

}
