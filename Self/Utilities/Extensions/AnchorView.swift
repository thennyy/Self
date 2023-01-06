//
//  AnchorView.swift
//  SeekSupport
//
//  Created by Thenny Chhorn on 7/9/20.
//  Copyright © 2020 Thenny Chhorn. All rights reserved.
//

import UIKit
public struct AnchoredConstraints {
    public var top, leading, bottom, trialing, width, height: NSLayoutConstraint?
}
extension UIView {
    
    func fillSuperView(padding: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        self.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding).isActive = true
        self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding).isActive = true
        self.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding).isActive = true
        
    }
    func anchor(top: NSLayoutYAxisAnchor? = nil , left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil , right: NSLayoutXAxisAnchor? = nil,  paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, bottomAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingBottom: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let top = topAnchor {
            anchor(top: top, paddingTop: paddingTop)
        }
        if let bottom = bottomAnchor {
            anchor(bottom: bottom, paddingBottom: paddingBottom)
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, rightAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, paddingRight: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
        if let right = rightAnchor {
            anchor(right: right, paddingRight: paddingRight)
        }
    }
    @discardableResult
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero, constant: CGFloat? = 0) -> AnchoredConstraints {

        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()

        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
            
        }

        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }

        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }

        if let trailing = trailing {

            anchoredConstraints.trialing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }

        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
    

        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trialing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }

        return anchoredConstraints
    }
    @discardableResult
    public func fillSuperview(padding: UIEdgeInsets = .zero, constant: CGFloat = 0) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        let anchoredConstraints = AnchoredConstraints()
        guard let superviewTopAnchor = superview?.topAnchor,
            let superviewBottomAnchor = superview?.bottomAnchor,
            let superviewLeadingAnchor = superview?.leadingAnchor,
            let superviewTrailingAnchor = superview?.trailingAnchor else {
                return anchoredConstraints
        }
        
        
        return anchor(top: superviewTopAnchor, leading: superviewLeadingAnchor, bottom: superviewBottomAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}



