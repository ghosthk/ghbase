//
//  ViewController.swift
//  Demo
//
//  Created by Ghost on 2023/5/17.
//

import UIKit
import gh_base

class ViewController: GHBaseNC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "")
        image?.getThumbnail()
        let basebutton = GHBaseButton()
        basebutton.normalBGColor
        
        let grView = GHGradientView()
        grView.locations
    }


}

