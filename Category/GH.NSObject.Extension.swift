//
//  NSObject.Extension.swift

//
//  Created by Ghost on 2023/2/27.
//

import Foundation
import UIKit

extension NSObject {
    
    class public var className : String {
        get {
            let name = NSStringFromClass(self)
            if (name.contains(".")) {
                return name.components(separatedBy: ".").last!
            } else {
                return name
            }
        }
    }
    
    class public var nib : UINib {
        get {
            return UINib(nibName: self.className, bundle: nil)
        }
    }
}
