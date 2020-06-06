//
//  HorizontalGradient.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/6/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import UIKit

@IBDesignable
class HorizontalGradient: UIView {
    @IBInspectable var startColor: UIColor = UIColor.white {didSet { setupGradient()}}
    @IBInspectable var endColor: UIColor = UIColor.black {didSet { setupGradient()}}
    var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
    override public class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    func setupGradient() {
        gradientLayer.startPoint = .init(x: 0, y: 0.5)
        gradientLayer.endPoint = .init(x: 1, y: 0.5)
        gradientLayer.locations = [0.2, 1]
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    
}


