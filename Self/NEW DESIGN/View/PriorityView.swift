//
//  PriorityView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/19/22.
//

import UIKit

class PriorityView: UIView {
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    convenience init(string: String) {
        self.init()
        
        let titleLabel = UILabel()
        titleLabel.text = "Reminder"
        titleLabel.font = .titleFontLight
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        addSubview(titleLabel)
        titleLabel.setDimensions(height: 33, width: 200)
        titleLabel.centerX(inView: self, topAnchor: topAnchor, paddingTop: 9)
        
        
        let lineView = UIView()
        lineView.backgroundColor  = .defaultGray
        
        addSubview(lineView)
        lineView.anchor(top: titleLabel.bottomAnchor,
                        left: leftAnchor,
                        right: rightAnchor, paddingTop: 9,
                        height: 0.5)
        
        let contentText = UILabel()
        contentText.text = string
        contentText.font = .mediumFont 
        contentText.numberOfLines = 0
        contentText.textColor = .label
        addSubview(contentText)
        contentText.anchor(top: lineView.bottomAnchor,
                           left: leftAnchor,
                           right: rightAnchor, paddingTop: 20, paddingLeft: 20)
        
        
        layer.cornerRadius = 25
        layer.shadowRadius = 9
        layer.shadowOpacity = 0.1
        layer.borderColor = UIColor.defaultGray.cgColor
        layer.borderWidth = 0.5
 
        backgroundColor = .defaultColor
        
    }
}
