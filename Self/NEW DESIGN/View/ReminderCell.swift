//
//  ReminderCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/20/22.
//

import UIKit

class ReminderCell: UICollectionViewCell {
    
    static let identifier = "cellIdentifier"
    
    private let priorityView = PriorityView(string: "Cleaning bathroom\nCleaning dishes")
   
    private lazy var pinImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.paperClipImage, for: .normal)
        button.tintColor = .greenColor
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        addSubview(priorityView)
        priorityView.anchor(top: topAnchor,
                            left: leftAnchor,
                            bottom: bottomAnchor,
                            right: rightAnchor,
                            paddingTop: 30,
                            paddingLeft: 20,
                            paddingBottom: 30,
                            paddingRight: 20)
        
        addSubview(pinImageButton)
        pinImageButton.setDimensions(height: 33, width: 33)
        
        pinImageButton.anchor(top: priorityView.topAnchor, right: priorityView.rightAnchor)

    }
}
