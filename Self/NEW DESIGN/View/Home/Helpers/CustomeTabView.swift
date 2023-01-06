//
//  CustomeTabView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/15/22.
//

import UIKit

enum TabBar: Int, CaseIterable {
    case home
    case reflection
    case goal
    case note
    case diary
}
protocol CustomeTabBarViewDelegate: AnyObject {
    
    func customTabBarView(_ view: CustomeTabView, reflectButton: UIButton)
    func customTabBarView(_ view: CustomeTabView, goalButton: UIButton)
    func customTabBarView(_ view: CustomeTabView, noteButton: UIButton)
    func customTabBarView(_ view: CustomeTabView, diaryButton: UIButton)
}
class TabBarButton: UIButton {
    
    
    convenience init(titleString: String, tintedColor: UIColor? = .greenColor, iconImage: UIImage) {
        self.init()
        
        
        titleLabel?.font = .titleFont
        tintColor = tintedColor
        setImage(iconImage, for: .normal)
        
        let label = UILabel()
        label.text = titleString
        label.font = .tabBarFont
        label.textColor = .label
        label.textAlignment = .center
        
//        addSubview(label)
//        label.anchor(left: leftAnchor,
//                     bottom: bottomAnchor,
//                     right: rightAnchor, paddingBottom: 6)
        
    }
}
class CustomeTabView: UIView {
    
    weak var delegate: CustomeTabBarViewDelegate?
    
    var selectedTintColor: UIColor?
    private let button = TabBarButton(type: .system)
    private let homeButton = TabBarButton(titleString: "Home",tintedColor: .selectedButton, iconImage: .homeImage!)
    private let reflectionButton = TabBarButton(titleString: "Reflect", iconImage: .reflectionImage!)
    private let noteButton = TabBarButton(titleString: "Note", iconImage: .noteImage!)
    private let goalButton = TabBarButton(titleString: "Goal", iconImage: .goalImage!)
    private let diaryButton = TabBarButton(titleString: "Diary", iconImage: .diaryImage!)
 
    
    convenience init(delegate: CustomeTabBarViewDelegate ) {
       
        self.init()
        self.delegate = delegate
         
        configureTabBarButton()
        
        backgroundColor = .shareColor
        layer.borderColor = UIColor.defaultGray.cgColor
   
        let lineView = UIView()
     //   lineView.backgroundColor = .defaultGray
        
        addSubview(lineView)
        lineView.anchor(top: topAnchor,
                        left: leftAnchor,
                        right: rightAnchor,
                        paddingTop: 12, 
                        height: 0.5)
        
        let stackView = UIStackView(arrangedSubviews: [homeButton,
                                                       reflectionButton,
                                                       goalButton,
                                                       noteButton,
                                                       diaryButton ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingLeft: 12,
                         paddingRight: 12)
        
         
         
    }

    private func configureTabBarButton() {
        homeButton.addTarget(self, action: #selector(handleHomeTabBarButton), for: .touchUpInside)
        reflectionButton.addTarget(self, action: #selector(handleReflectionTabBarButton), for: .touchUpInside)
        goalButton.addTarget(self, action: #selector(handleGoalTabBarButton), for: .touchUpInside)
        noteButton.addTarget(self, action: #selector(handleNoteTabBarButton), for: .touchUpInside)
        diaryButton.addTarget(self, action: #selector(handleDiaryTabBarButton), for: .touchUpInside)

    }
    @objc func handleHomeTabBarButton(_ sender: UIButton) {
       // delegate?.customTabBarView(self, button: sender, tabBar: .home)
    }
    @objc func handleReflectionTabBarButton(_ sender: UIButton) {
        delegate?.customTabBarView(self, reflectButton: sender)
    }
    @objc func handleGoalTabBarButton(_ sender: UIButton) {
        delegate?.customTabBarView(self, goalButton: sender)
    }
    @objc func handleNoteTabBarButton(_ sender: UIButton) {
        delegate?.customTabBarView(self, noteButton: sender)
    }
    @objc func handleDiaryTabBarButton(_ sender: UIButton) {
        delegate?.customTabBarView(self, diaryButton: sender)
    }
     
}
