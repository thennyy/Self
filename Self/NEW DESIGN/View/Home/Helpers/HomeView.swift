//
//  HomeView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/14/22.
//

import UIKit
protocol HomeViewDelegate: AnyObject {
    func homeView(_ view: HomeView)
}
class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    let calenderView = CalendarView()
    let dailyQuoteView = DailyQuoteView()
    lazy var addReflectionView = AddReflectionView(delegate: self)
    
    static let identifier = "homeCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .shareColor
        layer.cornerRadius = 20
        
        addSubview(calenderView)
        calenderView.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor,
                            height: 130)

        addReflectionView.layer.cornerRadius = 60/2
        addSubview(addReflectionView)
        addReflectionView.anchor(top: topAnchor,
                                 left: leftAnchor,
                                 right: rightAnchor,
                                 paddingTop: 20,
                                 paddingLeft: 20,
                                 paddingRight: 20,
                                 height: 60)
        
        addSubview(dailyQuoteView)
        dailyQuoteView.anchor(top: addReflectionView.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              paddingTop: 20, paddingLeft: 20,
                              paddingRight: 20, height: 300)

      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension HomeView: AddReflectionViewDelegate {
    func addReflectionView(_ view: AddReflectionView, startButton: CustomizedButton) {
        delegate?.homeView(self)
    }
    
}
