//
//  ScrollView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/27/22.
//

import UIKit

class CustomScrollView: UIScrollView {
    
    convenience init(firstArrangeView: UIView, secondView: UIView) {
        self.init()
        
        let stackView = UIStackView(arrangedSubviews: [firstArrangeView, secondView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 9
        stackView.distribution = .fill
        
        addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

    }
}
