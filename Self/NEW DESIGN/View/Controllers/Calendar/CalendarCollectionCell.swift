//
//  CalendarCollectionCell.swift
//  Self
//
//  Created by Thenny Chhorn on 10/6/22.
//

import UIKit
enum todayDate: Int, CaseIterable {
    case Sun
    case Mon
    case Tue
    case Wed
    case Thur
    case Fri
    case Sat
    
    var dayDescription: String {
        switch self {
        case .Sun:
            return "Sunday"
        case .Mon:
            return "Monday"
        case .Tue:
            return "Tuesday"
        case .Wed:
            return "Wednesday"
        case .Thur:
            return "Thursday"
        case .Fri:
            return "Friday"
        case .Sat:
            return "Saturday"
        }
    }
}
class CalendarCollectionCell: UICollectionViewCell {
    
    static let identifier = "CalendarCell"
    let date = Date()
    var nextDate = Date()
    
    var daysButtons = [UIButton]()
   
    var dayArrays: [String]! {
        didSet {
           
           // configureTodayDate()
           
        }
    }

    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumLight
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        
        
        contentView.addSubview(dateLabel)
       // dateLabel.backgroundColor = .greenColor
       // dateLabel.textColor = .white
        dateLabel.setDimensions(height: 36, width: 36)
        dateLabel.layer.cornerRadius = 36/2
        dateLabel.clipsToBounds = true
        dateLabel.fillSuperView()
        
//        dateLabel.anchor(top: topAnchor,
//                         left: leftAnchor,
//                         bottom: bottomAnchor,
//                         right: rightAnchor)
        
    }
    
    func createDayofTheWeek(_ index: Int, dayTint: UIColor? = .black,
                            backGround: UIColor? = .calendarGray) -> UIButton {
        
        let dayButton = UIButton(type: .system)
        
        dayButton.tintColor = dayTint
        dayButton.titleLabel?.font = .regFont
        dayButton.titleLabel?.textAlignment = .center
        dayButton.backgroundColor = backGround
        dayButton.layer.cornerRadius = 18
        
        return dayButton
        
    }
    
    func configureTodayDate() {
     
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//
//        let calendar = CalendarViewModel()
//
//        let nextmonth = calendar.plusMonth(date: Date())
//        let year = calendar.yearString(date: Date())
//        print("DATE This month ******* \(nextmonth) \(year)")
//        print("TODAY DATE This month ******* \(nextDate), \(date)")
//
            if dateLabel.text == String(CalendarViewModel().dayOfMonth(date: Date())) {
                dateLabel.textColor = .white
                dateLabel.backgroundColor = .greenColor
            }else {
                dateLabel.textColor = .label
                dateLabel.backgroundColor = .defaultColor
            }
   
    }
}

