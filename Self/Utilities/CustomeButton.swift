//
//  CustomeButton.swift
//  Self
//
//  Created by Thenny Chhorn on 9/16/22.
//

import UIKit

class CustomButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let gradientLayer = CAGradientLayer()
        let leftColor = UIColor.calendarGray
        let rightColor = UIColor.greenColor
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        let cornerRadius = rect.height/2
        let maskLayer = CAShapeLayer()
        let maskPath = CGMutablePath()
        
     //   setTitleColor(.black, for: .normal)
        
        maskPath.addPath(UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath)
        maskPath.addPath(UIBezierPath(roundedRect: rect.insetBy(dx: 2, dy: 2), cornerRadius: cornerRadius).cgPath)
        
        maskLayer.path = maskPath
        maskLayer.fillRule = .evenOdd
        gradientLayer.mask = maskLayer
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        gradientLayer.frame = rect
        
        
        
    }
}
