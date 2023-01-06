//
//  CustomizedButton.swift
//  Self
//
//  Created by Thenny Chhorn on 9/16/22.
//

import UIKit

class CustomizedButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let gradientLayer = CAGradientLayer()
        let leftColor = UIColor.lightGreen
        let rightColor = UIColor.greenColor
        
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.titleFont
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
        layer.cornerRadius = rect.height/2
        clipsToBounds = true
        gradientLayer.frame = rect
        
        
    }
}
