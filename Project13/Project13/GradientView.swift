//
//  GradientView.swift
//  Project13
//
//  Created by Alex Motor on 8/19/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class GradientView: UIView {

    lazy var gradientLayer: CAGradientLayer = {
       let layer = CAGradientLayer()
        layer.colors = [
            UIColor.clear.cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.75).cgColor
        ]
        layer.locations = [0, 1]
        return layer
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
}
