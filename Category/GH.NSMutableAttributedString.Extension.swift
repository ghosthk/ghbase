//
//  NSMutableAttributedString.Extension.swift

//
//  Created by Ghost on 2023/2/27.
//

import Foundation

extension NSMutableAttributedString {
    
    public func addAttributes(attrs: [NSAttributedString.Key : Any], text: String) -> Bool {
        let foundRange = self.mutableString.range(of: text)
        if foundRange.location != NSNotFound {
            self.addAttributes(attrs, range: foundRange)
            return true
        }
        return false
    }
    
    public func setAsLink(textToFind:String, linkURL:String) -> Bool {
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttributes([NSAttributedString.Key.link : linkURL], range: foundRange)
            return true
        }
        return false
    }
    
}
