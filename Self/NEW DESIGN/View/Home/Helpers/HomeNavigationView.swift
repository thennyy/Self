//
//  HomeNavigationView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/14/22.
//

import UIKit
protocol HomeNavigationViewDelegate: AnyObject {
    func homeNavigationView(_ view: HomeNavigationView, calendarButton: UIButton)
    
}
class HomeNavigationView: UIView {
    
    weak var delegate: HomeNavigationViewDelegate?
    
    lazy var notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage.notificationImage, for: .normal)
        button.tintColor = .greenColor
        return button
    }()
    lazy var calendarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage.calendarImage, for: .normal)
        button.tintColor = .greenColor
        return button
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "S.E.L.F"
        label.font = .titleHomeFont
        label.textColor = .black
        return label
    }()
 
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.font = .regFont
        label.layer.cornerRadius = 15
        label.textColor = .black
        return label
    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
    convenience init(delegate: HomeNavigationViewDelegate) {
        self.init()
        
        self.delegate = delegate
        
       // backgroundColor = .greenColor
        layer.cornerRadius = 30
        clipsToBounds = true
        
        addSubview(titleLabel)
        titleLabel.centerX(inView: self,
                           topAnchor: topAnchor,
                           paddingTop: 15)
        

        
        addSubview(notificationButton)
        notificationButton.setDimensions(height: 42, width: 42)
        notificationButton.centerY(inView: titleLabel,
                                   leftAnchor: leftAnchor,
                                   paddingLeft: 20)
        
        addSubview(calendarButton)
        calendarButton.setDimensions(height: 42, width: 42)
        calendarButton.centerY(inView: titleLabel,
                               rightAnchor: rightAnchor,
                               paddingRight: 20)
        
        calendarButton.addTarget(self, action: #selector(handleCalendarButton), for: .touchUpInside)
        
        addSubview(monthLabel)
        monthLabel.anchor(top: titleLabel.bottomAnchor,
                          left: notificationButton.leftAnchor,
                          right: calendarButton.rightAnchor, paddingTop: 20,
                          height: 30)
        
        monthLabel.layer.cornerRadius = 15
        monthLabel.clipsToBounds = true
        
        configureDateAndDay()
        
    }
    @objc func handleCalendarButton(_ sender: UIButton) {
        delegate?.homeNavigationView(self, calendarButton: sender)
    }
    func configureDateAndDay() {
        
        let date = Date()
        let day = Date().dayoftheWeek()
        let dateString = Date().dayofMonth()
        let month = CalendarViewModel().monthString(date: date)
        let year = CalendarViewModel().yearString(date: date)
        monthLabel.text =  day + " " + month + " " + dateString + ", " + year
        
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
