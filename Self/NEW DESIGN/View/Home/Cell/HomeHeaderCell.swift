//
//  HomeHeaderCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/15/22.
//

import UIKit

protocol HomeHeaderCellDelegate: AnyObject {
    func homeHeaderCell(_ header: HomeHeaderCell, addReflectionView: AddReflectionView)
}
class HomeHeaderCell: UICollectionViewCell {
    
    static let identifier = "homeHeadercell"
    
    weak var delegate: HomeHeaderCellDelegate?
    
    let calenderView = CalendarView()
    let dailyQuoteView = DailyQuoteView()
    let addReflectionView = AddReflectionView()
    let addreminderView = AddReminderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
      //  addReflectionView.delegate = self
        
        calenderView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        dailyQuoteView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        addReflectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [calenderView,
                                                       dailyQuoteView,
                                                       addReflectionView,
                                                       addreminderView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor, paddingTop: 20, paddingBottom: 30)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func handleStartButton() {
       print("DEBUG: ADD START REFLECTION")
        delegate?.homeHeaderCell(self, addReflectionView: addReflectionView)
    }
}
extension HomeHeaderCell: AddReflectionViewDelegate {
    
    func addReflectionView(_ view: AddReflectionView, startButton: CustomizedButton) {
    
        startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        
    }
    
    
}
