//
//  BasePresentationVC.swift
//  QR5
//
//  Created by Ghost on 2023/3/14.
//

import UIKit

class BasePresentationVC: BaseVC {
    
    private var completionBlock:  GPVoidBlock?
    private var dismissBlock: GPAnyBlock?
    private var isFirstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.view.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstLoad {
            isFirstLoad = false
            __showAnimation()
        }
    }
    
    public func show(_ on: UIViewController? = nil, completion: GPVoidBlock? = nil, dismiss: GPAnyBlock? = nil) {
        modalPresentationStyle = .overCurrentContext
        let onVC : UIViewController
        if on != nil {
            onVC = on!
        } else {
            onVC = (UIWindow.currentVC())!
        }
        completionBlock = completion
        dismissBlock = dismiss
        onVC.present(self, animated: false)
    }
    
    public func dismiss(any: Any? = nil, completion:GPBoolBlock? = nil) {
        hidenAnimation { finished in
            self.dismiss(animated: false) {
                if completion != nil{
                    completion!(finished);
                }
                if self.dismissBlock != nil {
                    self.dismissBlock!(any);
                }
            }
        }
    }
    
    /// 需要子类重写显示动画
    public func showAnimation(completion: GPBoolBlock? = nil) {
        assert(false)
    }
    /// 需要子类重写隐藏动画
    public func hidenAnimation(completion: GPBoolBlock? = nil) {
        assert(false)
    }
}

// MARK: - 默认动画供子类调用
extension BasePresentationVC {
    /// 显示 alert 的动画 contentview:alert框的view
    public func showAlertAnimation(contentView: UIView? = nil, completion: GPBoolBlock? = nil) {
        self.view.alpha = 1
        if contentView != nil {
            contentView!.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 15, options: .curveLinear) {
            if contentView != nil {
                contentView!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.7)
        } completion: { finished in
            if completion != nil {
                completion!(finished)
            }
        }
    }
    
    /// 隐藏 alert 的动画 contentview:alert框的view
    public func hidenAlertAnimation(contentView: UIView? = nil, completion: GPBoolBlock? = nil) {
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 0.0
        } completion: { finished in
            if completion != nil {
                completion!(finished)
            }
        }
    }

    /// 显示 底部弹出内容 的动画 contentview:底部弹框的view
    public func showActionSheetAnimation(contentView: UIView? = nil, completion: GPBoolBlock? = nil) {
        self.view.alpha = 1
        let contentHeight: CGFloat
        if contentView != nil {
            contentHeight = contentView!.frame.height
            contentView!.transform = CGAffineTransform(translationX: 0.0, y: contentHeight)
        } else {
            contentHeight = 0.0
        }
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
            if contentView != nil {
                contentView!.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.7)
        } completion: { finished in
            if completion != nil {
                completion!(finished)
            }
        }
    }
    /// 隐藏 底部弹出内容 的动画 contentview:底部弹框的view
    public func hidenActionSheetAnimation(contentView: UIView? = nil, completion: GPBoolBlock? = nil) {
        let contentHeight: CGFloat
        if contentView != nil {
            contentHeight = contentView!.frame.height
        } else {
            contentHeight = 0.0
        }
        UIView.animate(withDuration: 0.3) {
            if contentView != nil {
                contentView!.transform = CGAffineTransform(translationX: 0, y: contentHeight)
            }
            self.view.alpha = 0.0
        } completion: { finished in
            if completion != nil {
                completion!(finished)
            }
        }
    }
}

extension BasePresentationVC {
    private func __showAnimation() {
        showAnimation { [weak self] result in
            if self?.completionBlock != nil {
                self!.completionBlock!()
            }
        }
    }
}

