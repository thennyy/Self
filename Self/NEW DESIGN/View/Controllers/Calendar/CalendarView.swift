//
//  CalendarCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/14/22.
//

import UIKit

class CalendarView: UIView {
    
    static let identifier = "calendarCell"
    var dayButtons = [UIButton]()

    private let monthLabel: UILabel = {
        let label = UILabel()
       // label.text = "September"
        label.font = .regFont
       // label.backgroundColor = .shareColor
        label.layer.cornerRadius = 15
        //label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
   
       // backgroundColor = .shareColor
        layer.cornerRadius = 12
        clipsToBounds = true
        
        addSubview(monthLabel)
        monthLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          paddingLeft: 20,
                          height: 45)
        monthLabel.layer.cornerRadius = 15
        monthLabel.clipsToBounds = true
        
        /*
        let day1 = createDayofTheWeek(0, text: "Sun")
        let day2 = createDayofTheWeek(1, text: "Mon")
        let day3 = createDayofTheWeek(2, text: "Tue")
        let day4 = createDayofTheWeek(3, text: "Wed")
        let day5 = createDayofTheWeek(4, text: "Thur")
        let day6 = createDayofTheWeek(5, text: "Fri")
        let day7 = createDayofTheWeek(6, text: "Sat")
        
        let date1 = createDateOfTheWeek(0, text: "2")
        let date2 = createDateOfTheWeek(1, text: "3")
        let date3 = createDateOfTheWeek(2, text: "4")
        let date4 = createDateOfTheWeek(3, text: "5")
        let date5 = createDateOfTheWeek(4, text: "6")
        let date6 = createDateOfTheWeek(5, text: "7")
        let date7 = createDateOfTheWeek(6, text: "8")
        
        
        dayButtons.append(day1)
        dayButtons.append(day2)
        dayButtons.append(day3)
        dayButtons.append(day4)
        dayButtons.append(day5)
        dayButtons.append(day6)
        dayButtons.append(day7)
        
        
        let dayStack = UIStackView(arrangedSubviews: [day1,day2,day3,day4,day5,day6,day7])

        
        dayStack.translatesAutoresizingMaskIntoConstraints = false
        dayStack.spacing = 1
        dayStack.axis = .horizontal
        dayStack.distribution = .fillEqually
        
        
        let dateStack = UIStackView(arrangedSubviews: [date1,date2,date3,date4,date5,date6,date7])
        dateStack.translatesAutoresizingMaskIntoConstraints = false
        dateStack.spacing = 1
        dateStack.axis = .horizontal
        dateStack.distribution = .fillEqually
        
        
        let stackView = UIStackView(arrangedSubviews: [dayStack, dateStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 6
        stackView.axis = .vertical
        
        
        addSubview(stackView)
        stackView.anchor(top: monthLabel.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingTop: 9)
                      
           */
      //  configureDateAndDay()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDayofTheWeek(_ index: Int, text: String, dayTint: UIColor? = .black,
                            backGround: UIColor? = .defaultColor) -> UIButton {
        
        let dayButton = UIButton(type: .system)
        
        dayButton.tintColor = dayTint
        dayButton.titleLabel?.font = .regFont
        dayButton.backgroundColor = backGround
        dayButton.layer.cornerRadius = 18
        dayButton.setTitle(text, for: .normal)
        
        return dayButton
        
    }
    func createDateOfTheWeek(_ index: Int, text: String? = "", dayTint: UIColor? = .label) -> UIButton {
        
        let dateButton = UIButton(type: .system)
        
        dateButton.tintColor = dayTint
        dateButton.titleLabel?.font = .titleFont
        dateButton.backgroundColor = .calendarGray
        dateButton.layer.cornerRadius = 18
        dateButton.setTitle(text, for: .normal)
        
        return dateButton
        
    }
    func configureDateAndDay() {
        
        let date = Date()
        let day = Date().dayoftheWeek()
        let dateString = Date().dayofMonth()
        let month = CalendarViewModel().monthString(date: date)
        let year = CalendarViewModel().yearString(date: date)
        monthLabel.text =  day + " " + month + " " + dateString + ", " + year
        
    }
 
}
