//
//  AddReminderCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/15/22.
//

import UIKit
class AddReminderView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add reminder"
        label.font = .titleFont
        return label
    }()
    private let lightBlueButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .titleFont
        button.backgroundColor = .lightBlue
        button.tintColor = .black
        button.isEnabled = false
        button.layer.cornerRadius = 3
        
        return button
    }()
    private let peachButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .titleFont
        button.backgroundColor = .peachColor
        button.tintColor = .black
        button.isEnabled = false
        button.layer.cornerRadius = 3
        
        return button
    }()
    private let lavendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .titleFont
        button.backgroundColor = .lavendarColor
        button.tintColor = .black
        button.isEnabled = false
        button.layer.cornerRadius = 3
        
        return button
    }()
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .titleFont
      //  button.tintColor = .black
        button.setImage(UIImage.addImage, for: .normal)
  
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
       // contentView.addSubview(titleLabel)
        
        addSubview(titleLabel)
        titleLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 30)
        
        addSubview(plusButton)
        plusButton.setDimensions(height: 45, width: 45)
        plusButton.centerY(inView: titleLabel,
                           leftAnchor: titleLabel.rightAnchor,
                           paddingLeft: 9)
        
        lightBlueButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        let stackView = UIStackView(arrangedSubviews: [lightBlueButton,
                                                       peachButton,
                                                       lavendarButton])
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.setDimensions(height: 36, width: 36*3+18)
        stackView.centerY(inView: titleLabel, rightAnchor: rightAnchor, paddingRight: 30)
        
       // stackView.centerY(inView: self, rightAnchor: rightAnchor, paddingRight: 30)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

