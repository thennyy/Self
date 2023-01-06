//
//  CalendarController.swift
//  Self
//
//  Created by Thenny Chhorn on 10/6/22.
//

import UIKit

class CalendarController: UICollectionViewController {
    
    var selectedDate = Date()
    var totallSquares = [String]()
    var currentDate = 0
    var nextDate = Date()
    
    private lazy var navigationView = CustomNavigationView(titleString: "Calendar",
                                                           image: .addImage!,
                                                           backImage: .removeImage,
                                                           imageBackgroundColor: .defaultColor,
                                                           delegate: self)
    
   
    lazy var calendarView = CalendarHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.delegate = self
        configureUI()
        configureCalendar()
        calendarView.delegate = self
        
        calendarView.calendarController = self
      //  calendarView.calendarDelegate = delegate
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    private func configureUI() {
        
        view.backgroundColor = .defaultColor
        view.addSubview(navigationView)
        navigationView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor,
                                  height: 70)

        view.addSubview(calendarView)
        calendarView.anchor(top: navigationView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 120)
        
        collectionView.backgroundColor = .defaultColor 
        collectionView.register(CalendarCollectionCell.self, forCellWithReuseIdentifier: CalendarCollectionCell.identifier)
        
        collectionView.contentInset = UIEdgeInsets(top: 220, left: 20, bottom: 0, right: 20)
        
        
    }
    
    func configureCalendar() {
        
        totallSquares.removeAll()
        let daysInMonth = CalendarViewModel().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarViewModel().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarViewModel().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        while(count < 42) {
            if (count <= startingSpaces || count - startingSpaces > daysInMonth) {
                totallSquares.append("")
            }else {
                totallSquares.append(String(count - startingSpaces))
            }
            count += 1
            
        }
        
        collectionView.reloadData() 
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
}
extension CalendarController {
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionCell.identifier, for: indexPath) as! CalendarCollectionCell
        cell.nextDate = self.nextDate
    
        cell.dateLabel.text = totallSquares[indexPath.row]
        
        cell.dayArrays = totallSquares
        
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return   totallSquares.count
    }
    
}
extension CalendarController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       // let height = (collectionView.frame.height - 1) / 9
        let width = (collectionView.frame.width - 1) / 8
       
        return CGSize(width: width, height: 60)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}


extension CalendarController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
       // navigationController?.popViewController(animated: true)
        dismiss(animated: true)
        
    }
    
}
extension CalendarController: CalendarHelperDelegate {
   
    func calendarHelper(_ view: CalendarHelper, nextMonthButton: UIButton, delegate: CalendarHelperDelegate) {

        selectedDate = CalendarViewModel().plusMonth(date: selectedDate)
        print("Next MONTH \(selectedDate)")
        let month =  CalendarViewModel().monthString(date: selectedDate) + " " + CalendarViewModel().yearString(date: selectedDate)
        calendarView.configureMonth(month)
        nextDate = selectedDate
        configureCalendar()
        
    }

    func calendarHelper(_ view: CalendarHelper, previousMonthButton: UIButton) {
        selectedDate = CalendarViewModel().minusMonth(date: selectedDate)
        print("PRE MONTH \(selectedDate)")
        let month =  CalendarViewModel().monthString(date: selectedDate) + " " + CalendarViewModel().yearString(date: selectedDate)
        nextDate = selectedDate
        calendarView.configureMonth(month)
        configureCalendar()
        
    }
    
    
}
