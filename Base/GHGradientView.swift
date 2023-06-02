//
//  GHGradientView.swift
//
//  Created by Ghost on 2022/9/2.
//

import UIKit

class GHGradientView: GHBaseView {
    private var _startPoint = CGPoint(x: 0, y: 0)
    var startPoint : CGPoint {
        set {
            _startPoint = newValue
            self.gradientLayer.startPoint = newValue
        }
        get {
            return _startPoint
        }
    }

    private var _endPoint = CGPoint(x: 0.0, y: 0.5)
    var endPoint : CGPoint {
        set {
            _endPoint = newValue
            self.gradientLayer.endPoint = newValue
        }
        get {
            return _endPoint
        }
    }
    private var _colors : [UIColor] = []
    var colors : [UIColor] {
        set {
            _colors = newValue
            var newColors : [CGColor] = []
            for color in newValue {
                newColors.append(color.cgColor)
            }
            self.gradientLayer.colors = newColors
        }
        get {
            return _colors
        }
    }
    private var _locations : [NSNumber] = [(0.0), (1.0)]
    var locations : [NSNumber] {
        set {
            _locations = newValue
            self.gradientLayer.locations = newValue
        }
        get {
            return _locations
        }
    }
    
    private(set) var gradientLayer = CAGradientLayer()
    
    override func initViews() {
        super.initViews()
        layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
    }
}
