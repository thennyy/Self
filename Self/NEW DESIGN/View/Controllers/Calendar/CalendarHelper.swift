//
//  CalendarHelper.swift
//  Self
//
//  Created by Thenny Chhorn on 10/6/22.
//

import UIKit

enum selectedDay: Int, CaseIterable {
    case Sunday

}
protocol CalendarHelperDelegate: AnyObject {
   
    func calendarHelper(_ view: CalendarHelper, nextMonthButton: UIButton, delegate: CalendarHelperDelegate)
    func calendarHelper(_ view: CalendarHelper, previousMonthButton: UIButton)
}
class CalendarHelper: UIView {
    
    var selectedDate = Date()
    var dayButtons = [UIButton]()
    
    weak var delegate: CalendarHelperDelegate!
    
    var calendarController = CalendarController()
    
    let nextMonthButton = UIButton(type: .system)
    let preMonthButton = UIButton(type: .system)
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.mediumLight
        label.textColor = .label
        return label
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureCalendarDay()
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCalendarDay() {
        
        let day1 = createDayofTheWeek(0, text: "Sun")
        let day2 = createDayofTheWeek(1, text: "Mon")
        let day3 = createDayofTheWeek(2, text: "Tue") 
        let day4 = createDayofTheWeek(3, text: "Wed")
        let day5 = createDayofTheWeek(4, text: "Thur")
        let day6 = createDayofTheWeek(5, text: "Fri")
        let day7 = createDayofTheWeek(6, text: "Sat")
        
        dayButtons.append(day1)
        dayButtons.append(day2)
        dayButtons.append(day3)
        dayButtons.append(day4)
        dayButtons.append(day5)
        dayButtons.append(day6)
        dayButtons.append(day7)
        
        
        let stackView = UIStackView(arrangedSubviews: [day1,day2,day3,day4,day5,day6,day7])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.axis = .horizontal
        

        //  stackView.fillSuperView()
        monthLabel.text = CalendarViewModel().monthString(date: selectedDate) + " " + CalendarViewModel().yearString(date: selectedDate)
        
        addSubview(monthLabel)
        monthLabel.anchor(top: topAnchor,
                          left: leftAnchor,
                          right: rightAnchor,
                          height: 45)
        
        preMonthButton.tintColor = .greenColor
        preMonthButton.setImage(.lastMonthArrow, for: .normal)
        addSubview(preMonthButton)
        preMonthButton.centerY(inView: monthLabel,
                               leftAnchor: leftAnchor,
                               paddingLeft: 20)
        
        nextMonthButton.tintColor = .greenColor
        nextMonthButton.setImage(.nextMonthArrow, for: .normal)
        addSubview(nextMonthButton)
        nextMonthButton.centerY(inView: monthLabel,
                                rightAnchor: rightAnchor,
                                paddingRight: 20)
        
        addSubview(stackView)
        stackView.anchor(top: monthLabel.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        nextMonthButton.addTarget(self, action: #selector(handleNextMonth), for: .touchUpInside)
        preMonthButton.addTarget(self, action: #selector(handleLastMonth), for: .touchUpInside)
        
        configureDate()
        
    }
    
    func configureMonth(_ month: String) {
        monthLabel.text = month
        
    }
    func configureDate() {
        
        let day = Date().dayoftheWeek()
        print("DEBUG: DATE OF THE WEEK *** ", day)

    }
    
    func createDayofTheWeek(_ index: Int, text: String, dayTint: UIColor? = .label,
                            backGround: UIColor? = .defaultColor) -> UIButton {
        
        let dayButton = UIButton(type: .system)
        
        dayButton.tintColor = dayTint
        dayButton.titleLabel?.font = .regFont
        dayButton.backgroundColor = backGround
        dayButton.layer.cornerRadius = 18
        dayButton.setTitle(text, for: .normal)
        
        return dayButton
        
    }
    
    @objc func handleNextMonth(_ sender: UIButton) {
        
        delegate.calendarHelper(self, nextMonthButton: sender, delegate: delegate)
    }
    @objc func handleLastMonth(_ sender: UIButton) {
        delegate.calendarHelper(self, previousMonthButton: sender)
    }
}

