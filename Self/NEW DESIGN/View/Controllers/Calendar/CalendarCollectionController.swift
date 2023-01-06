//
//  CalendarCollectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 10/6/22.
//

import UIKit

class CalendarCollectionController: UICollectionViewController {
    
    let calendarView = UICalendarView()
    let gregorianCalendar = Calendar(identifier: .gregorian)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI() {
        
        collectionView.backgroundColor = .lightBlue
        collectionView.contentInset = UIEdgeInsets(top: 200,
                                                   left: 0,
                                                   bottom: 0,
                                                   right: 0)
        
        calendarView.calendar = gregorianCalendar
        calendarView.tintColor = .greenColor 
        view.addSubview(calendarView)
        calendarView.fillSuperView() 
    }
}
