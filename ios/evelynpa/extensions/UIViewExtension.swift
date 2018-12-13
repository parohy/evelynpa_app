//
//  UIViewExtension.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/13/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

extension UIView {
    func addGradientToView(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
