//
//  BaseVC.swift
//  QR5
//
//  Created by Ghost on 2023/3/10.
//

import UIKit
import SwifterSwift
import EachNavigationBar

class BaseVC: UIViewController {

    public class func instantiateNCByStoryboard() -> BaseNC {
        assert(false, "Subclass need overwrite")
        return BaseNC()
    }
    
    public class func instantiateByStoryboard() -> Self {
        assert(false, "Subclass need overwrite")
        return BaseVC() as! Self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigation.bar.backgroundColor = .white
        view.backgroundColor = UIColor(hex: 0xF2F5F7)

        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            navigation.item.leftBarButtonItem = .init(image: UIImage(named: "s_nav_back")?.original, style: .plain, target: self, action: #selector(backBarButonAction(_:)))
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    @objc @IBAction public func backBarButonAction(_ button: UIBarButtonItem?) {
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("\(Self.className) dealloc")
    }
}
