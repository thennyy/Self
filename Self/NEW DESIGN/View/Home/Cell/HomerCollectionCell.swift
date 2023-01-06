//
//  ReminderCollectionCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/15/22.
//

import UIKit
import CoreData

protocol HomeCollecionCellDelegate: AnyObject {
    func homeCollectionCell(_ cell: HomeCollectionCell,
                            data: NSManagedObject, index: Int)
}
class HomeCollectionCell: UICollectionViewCell {
    
    static let identifier = "homeCollectionCell"
    
    // MARK: - Properties
    
    var storage: String!
    
    var index = 0
    
    weak var delegate: HomeCollecionCellDelegate?
    
    var data: NSManagedObject! {
        
        didSet{
          
            guard let time = data?.value(forKey: "time") as? Double else {return}
            
            let convert = time*(-1)
            let date = Date(timeIntervalSince1970: convert)
          
            let shortDay =  date //date.dayoftheWeek()
            let formater = DateFormatter()
            formater.dateFormat = "EE"
           
            let inshort = formater.string(from: shortDay)
            dayLabel.text = inshort
            
            let longday = date
            formater.dateFormat = "MMM-dd"
            let inLong = formater.string(from: longday)
            
            dateLabel.text = inLong
            
            let hour = date
            formater.timeStyle = .short
            let stringHour = formater.string(from: hour)
            
            timeLabel.text = stringHour
            
            
        }
    }
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        //label.text = "Reminder"
        label.font = .mediumLight
        label.textColor = .label
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .regLight
        label.textAlignment = .center
        label.numberOfLines = 3
        label.textColor = .label
        return label
    }()
 
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .regFont
        label.textColor = .black
        label.backgroundColor = .calendarGray
    
        return label
    }()
    let contentLabel: UILabel = {
        let label = UILabel()
        
        label.font = .regFont
        label.textColor = .label
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .titleFont
        button.tintColor = .gray
        button.setImage(UIImage.editImage, for: .normal)
        button.addTarget(self, action: #selector(handleDeleteButton),
                         for: .touchUpInside)
        return button
    }()
    private let editeButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .titleFont
        button.setImage(UIImage.editImage, for: .normal)
  
        return button
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
       
       // backgroundColor = .shareColor
        contentView.addSubview(dateLabel)
        dateLabel.setDimensions(height: 30, width: 120)

        dateLabel.anchor(left: leftAnchor,
                         bottom: contentView.bottomAnchor,
                         paddingBottom: 20)

        contentView.addSubview(dayLabel)
        dayLabel.setDimensions(height: 45, width: 51)

        dayLabel.layer.cornerRadius = 18
        dayLabel.layer.masksToBounds = true
        
        dayLabel.centerX(inView: dateLabel,
                         bottomAnchor: dateLabel.topAnchor)

        let containerView = UIView()
      //  containerView.layer.borderWidth = 0.5
       // containerView.layer.borderColor = UIColor.defaultGray.cgColor
        containerView.backgroundColor = .shareColor
        contentView.addSubview(containerView)
        containerView.layer.cornerRadius = 18
        
        containerView.anchor(top: topAnchor,
                             left: dateLabel.rightAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor,
                             paddingTop: 9,
                             paddingLeft: 6,
                             paddingBottom: 9,
                             paddingRight: 20)
        
        containerView.addSubview(timeLabel)
        
        timeLabel.anchor(top: containerView.topAnchor,
                                  left: containerView.leftAnchor,
                                  paddingTop: 20,
                                  paddingLeft: 20)
        

        containerView.addSubview(contentLabel)
        contentLabel.anchor(top: timeLabel.bottomAnchor,
                            left: containerView.leftAnchor,
                            right: containerView.rightAnchor,
                            paddingTop: 9,paddingLeft: 20,
                            paddingRight: 20)

        containerView.addSubview(removeButton)
        removeButton.anchor(top: containerView.topAnchor,
                           right: containerView.rightAnchor,
                           paddingTop: 10,
                           paddingRight: 10,
                           width: 30, height: 30)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleDeleteButton(_ sender: UIButton) {
       
        delegate?.homeCollectionCell(self, data: data, index: index)
        
    }
    
}
