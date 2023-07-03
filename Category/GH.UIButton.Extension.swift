//
//  GH.UIButton.Extension.swift
//  Healthy2
//
//  Created by Ghost on 2023/6/25.
//

import Foundation

enum GHImageAlignType {
    case left
    case right
    case top
    case bottom
}

extension UIButton {
    
    func setImageAlign( type: GHImageAlignType, space: CGFloat) {
        
        let imageView_Width = self.imageView?.frame.size.width
        let imageView_Height = self.imageView?.frame.size.height
        let titleLabel_iCSWidth = self.titleLabel?.intrinsicContentSize.width
        let titleLabel_iCSHeight = self.titleLabel?.intrinsicContentSize.height
        
        switch type {
        case .left:
            if self.contentHorizontalAlignment == .left {
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: space, bottom: 0, right: 0)
            } else if self.contentHorizontalAlignment == .right {
                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: space)
            } else {
                let spacing_half = 0.5 * space;
                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -spacing_half, bottom: 0, right: spacing_half)
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: spacing_half, bottom: 0, right: -spacing_half)
            }
        case .right:
            let titleLabelWidth = self.titleLabel?.frame.size.width
            if self.contentHorizontalAlignment == .left {
                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: titleLabelWidth! + space, bottom: 0, right: 0)
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageView_Width!, bottom: 0, right: 0)
            } else if self.contentHorizontalAlignment == .right {
                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: -titleLabelWidth!)
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: imageView_Width! + space)
            } else {
                let imageOffset = titleLabelWidth! + 0.5 * space
                let titleOffset = imageView_Width! + 0.5 * space
                self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: imageOffset, bottom: 0, right: -imageOffset)
                self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -titleOffset, bottom: 0, right: titleOffset)
            }
        case .top:
            self.imageEdgeInsets = UIEdgeInsets.init(top: -(titleLabel_iCSHeight! + space), left: 0, bottom: 0, right: -titleLabel_iCSWidth!)
            self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageView_Width!, bottom: -(imageView_Height! + space), right: 0)
        case .bottom:
            self.imageEdgeInsets = UIEdgeInsets.init(top: titleLabel_iCSHeight! + space, left: 0, bottom: 0, right: -titleLabel_iCSWidth!)
            self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -imageView_Width!, bottom: imageView_Height! + space, right: 0)
        }
    }
    
}
