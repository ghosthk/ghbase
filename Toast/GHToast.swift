//
//  GHToast.swift
//  QR5
//
//  Created by Ghost on 2023/3/14.
//

import Foundation
import JDStatusBarNotification
import SVProgressHUD

public enum GHToastStyle {
case success
case warning
case error
}

open class GHToast {
    class public func show(text: String, duration: TimeInterval? = nil, style: GHToastStyle? = nil) {
        NotificationPresenter.shared().present(text: text, dismissAfterDelay: duration ?? 2, includedStyle: [.success: IncludedStatusBarNotificationStyle.success,                               .warning: IncludedStatusBarNotificationStyle.warning,                                  .error: IncludedStatusBarNotificationStyle.error][style] ?? .success)
    }
}


open class GHFullHUD {
    class public func show() {
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    class public func hiden() {
        SVProgressHUD.dismiss()
    }
}
