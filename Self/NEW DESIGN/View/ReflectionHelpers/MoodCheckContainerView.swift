//
//  MoodCheckContainerView.swift
//  Self
//
//  Created by Thenny Chhorn on 4/8/22.
//

import UIKit

class MoodCheckContainerView: UIView {
    
    lazy var segmentControl: UISegmentedControl = {
        
        let segment = UISegmentedControl()

        return segment
    }()
    private lazy var questionLabel: UILabel = {
        
        let label = UILabel()
        label.font = .mediumFont
        label.textColor = .label
    
        return label
    }()
    
    convenience init(answerSegment: [String], questionString: String) {
        self.init()
     
        segmentControl = UISegmentedControl(items: answerSegment)
        questionLabel.text = questionString
        
        let font = UIFont.mediumFont
        let textAttribute = [NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: UIColor.label]
        
        segmentControl.setTitleTextAttributes(textAttribute, for: .normal)
    
        
        configureUI()
        
    }
    
 
    private func configureUI() {
        
        backgroundColor = .defaultColor
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 30
        segmentControl.layer.borderWidth = 0.5
        segmentControl.layer.borderColor = UIColor.defaultGray.cgColor
        
        segmentControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
        let stackView = UIStackView(arrangedSubviews: [questionLabel, segmentControl])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        addSubview(stackView)
        stackView.centerY(inView: self,
                          leftAnchor: leftAnchor,
                          rightAnchor: rightAnchor,
                          paddingLeft: 20,
                          paddingRight: 20)

        
    }
 
}

