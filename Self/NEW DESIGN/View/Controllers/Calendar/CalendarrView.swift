//
//  CalendarView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/14/22.
//

import UIKit

class CalendarrView: UIButton {

    convenience init(day: String, date: String,
                     dayBackGround: UIColor? = .darkGray,
                     dayTint: UIColor? = .black,
                     dateTint: UIColor? = .label) {
        
        self.init()
        
        
        let dateLabel = UILabel()
        dateLabel.textColor = dateTint
        dateLabel.font = .titleFont
        dateLabel.textAlignment = .center
        
       // let dayButton = CustomButton(type: .system)
        let dayButton = UIButton(type: .system)
        dayButton.tintColor = dayTint
        dayButton.titleLabel?.font = .regFont
        dayButton.backgroundColor = dayBackGround
        dayButton.layer.cornerRadius = 18

        dateLabel.text = date
        dayButton.setTitle(day, for: .normal)
        dayButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
   
        
        let stackView = UIStackView(arrangedSubviews: [dayButton, dateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false 
        stackView.spacing = 3
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor)
       
      
      
    }
    

 
}
