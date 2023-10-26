//
//  BackgroundGradient.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 17/10/23.
//

import UIKit

final class Gradients {
    static func makeBackground(view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(named: "firstBackgroundColor")?.cgColor ?? UIColor.yellow.cgColor,
                                UIColor(named: "secondBackgroundColor")?.cgColor ?? UIColor.orange.cgColor,
                                UIColor(named: "thirdBackgroundColor")?.cgColor ?? UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
