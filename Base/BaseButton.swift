//
//  BaseButton.swift
//  QR5
//
//  Created by Ghost on 2023/3/13.
//

import Foundation
import UIKit

open class BaseButton: UIButton {

    @IBInspectable open var toucheScale = 1.0
    private var _normalBGColor : UIColor?
    @IBInspectable open var normalBGColor : UIColor? {
        set {
            _normalBGColor = newValue
            self.setBackgroundImage(self.imageWithColor(color: _normalBGColor), for: .normal)
        }
        get {
            return _normalBGColor
        }
    }
    private var _highlightBGColor : UIColor?
    @IBInspectable open var highlightBGColor : UIColor? {
        set {
            _highlightBGColor = newValue
            self.setBackgroundImage(self.imageWithColor(color: _highlightBGColor), for: .highlighted)
        }
        get {
            return _highlightBGColor
        }
    }
    private var _disableBGColor : UIColor?
    @IBInspectable open var disableBGColor : UIColor? {
        set {
            _disableBGColor = newValue
            self.setBackgroundImage(self.imageWithColor(color: _disableBGColor), for: .disabled)
        }
        get {
            return _disableBGColor
        }
    }
    private var _selectedBGColor : UIColor?
    @IBInspectable open var selectedBGColor : UIColor? {
        set {
            _selectedBGColor = newValue
            self.setBackgroundImage(self.imageWithColor(color: _selectedBGColor), for: .selected)
        }
        get {
            return _selectedBGColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.__initViews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.__initViews()
    }
    
    open override class func systemButton(with image: UIImage, target: Any?, action: Selector?) -> Self {
        let button = BaseButton.systemButton(with: image, target: target, action: action)
        return button as! Self
    }
        
    open lazy var nibFirstView : UIView? = {
        let path = Bundle.main.path(forResource: Self.className, ofType: "nib")
        if path != nil {
            if FileManager.default.fileExists(atPath: path!) {
                return (Bundle.main.loadNibNamed(NSStringFromClass(Self.self).components(separatedBy: ".").last!, owner: self, options: nil)?.first as! UIView)
            }
        }
        return nil
    }()
    
    private func __initViews() {
        if nibFirstView != nil {
            self.addSubview(nibFirstView!)
            
            nibFirstView?.translatesAutoresizingMaskIntoConstraints = false
            self.addConstraints([
                NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: .equal, toItem: nibFirstView, attribute: .leading, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: nibFirstView, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint.init(item: self, attribute: .trailing, relatedBy: .equal, toItem: nibFirstView, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: .equal, toItem: nibFirstView, attribute: .bottom, multiplier: 1.0, constant: 0.0)])
        }
        initViews()
    }
    
    open func initViews() {
        
    }

    deinit {
        print("\(Self.className) dealloc")
    }

    private func imageWithColor(color: UIColor?) -> UIImage? {
        if color == nil {
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color!.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        
    }
}

extension BaseButton {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if toucheScale != 1.0 {
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.init(scaleX: self.toucheScale, y: self.toucheScale)
            }
        }
    }
    
    open override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        if toucheScale != 1.0 {
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.identity
            }
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if toucheScale != 1.0 {
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.identity
            }
        }
    }
}
