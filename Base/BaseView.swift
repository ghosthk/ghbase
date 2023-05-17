//
//  BaseView.swift
//  QR5
//
//  Created by Ghost on 2023/3/10.
//

import UIKit

open class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.__initViews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.__initViews()
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
    
    @objc open func initViews() {
        
    }

    deinit {
        print("\(Self.className) dealloc")
    }
}
