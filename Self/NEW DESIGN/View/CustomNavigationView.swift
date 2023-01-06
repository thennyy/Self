//
//  CustomNavigationView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/21/22.
//

import UIKit
protocol CustomNavigationViewDelegate: AnyObject {
   
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton)
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton)
}
class CustomNavigationView: UIView {

    weak var delegate: CustomNavigationViewDelegate?
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleAddButton),
                         for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
     
        button.addTarget(self, action: #selector(handleBackButton),
                         for: .touchUpInside)
        button.tintColor = .greenColor 
        return button
    }()

    
    convenience init(titleString: String, image: UIImage? = nil, backImage: UIImage? = .backImage,
                     imageBackgroundColor: UIColor? = .greenColor,
                     tintColor: UIColor? = .white,
                     delegate: CustomNavigationViewDelegate? = nil) {
        
        self.init()
        self.delegate = delegate
        
        let titleLabel = UILabel()
        titleLabel.text = titleString
        titleLabel.font = .titleFontLight
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        addSubview(titleLabel)
        titleLabel.anchor(left: leftAnchor,
                          bottom: bottomAnchor,
                          right: rightAnchor,
                          paddingBottom: 20)
        

        addButton.setImage(image, for: .normal)
        addButton.backgroundColor = imageBackgroundColor
        addButton.tintColor = tintColor
        addSubview(addButton)
        addButton.setDimensions(height: 36, width: 36)
        addButton.layer.cornerRadius = 36/2
        addButton.centerY(inView: titleLabel,
                          rightAnchor: rightAnchor,
                          paddingRight: 20)
        
        backgroundColor = .defaultColor
        
        backButton.setImage(backImage, for: .normal)
        addSubview(backButton)
        backButton.setDimensions(height: 36, width: 36)
        backButton.centerY(inView: titleLabel,
                           leftAnchor: leftAnchor,
                           paddingLeft: 20)
        
        
        
    }
    
    func enableAddButton() {
        addButton.isEnabled = true 
    }
    func disableAddButton() {
        addButton.isEnabled = false 
    }
    @objc func handleAddButton(_ sender: UIButton) {
        delegate?.customNavigationView(self, addButton: sender)
    }
    @objc func handleBackButton(_ sender: UIButton) {
        delegate?.customNavigationView(self, backButton: sender)
    }
}

