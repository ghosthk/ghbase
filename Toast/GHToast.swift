//
//  GHToast.swift
//  QR5
//
//  Created by Ghost on 2023/3/14.
//

import Foundation
import JDStatusBarNotification
import SVProgressHUD

enum GHToastStyle {
case success
case warning
case error
}

class GHToast {
    class func show(text: String, duration: TimeInterval? = nil, style: GHToastStyle? = nil) {
        NotificationPresenter.shared().present(text: text, dismissAfterDelay: duration ?? 2, includedStyle: [.success: IncludedStatusBarNotificationStyle.success,                               .warning: IncludedStatusBarNotificationStyle.warning,                                  .error: IncludedStatusBarNotificationStyle.error][style] ?? .success)
    }
}


class GHFullHUD {
    class func show() {
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
    }
    
    class func hiden() {
        SVProgressHUD.dismiss()
    }
}
