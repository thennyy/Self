//
//  Extensions.swift
//  Self
//
//  Created by Thenny Chhorn on 9/14/22.
//

import UIKit

extension UIFont {
    
    static let regularFont = UIFont.systemFont(ofSize: 15)
    static let medium = UIFont.systemFont(ofSize: 15, weight: .medium)
    
    static let bold = UIFont.systemFont(ofSize: 15, weight: .bold)
    static let titleFont = UIFont.systemFont(ofSize: 21, weight: .medium)
    static let boldTitleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
    static let contentFont = UIFont.systemFont(ofSize: 21)
    
}
extension UIColor {
    
    static let defaultColor = UIColor.rgb(red: 244, green: 244, blue: 244)//UIColor.rgb(red: 255, green: 255, blue: 255)
    //static let greenColor = UIColor.rgb(red: 46, green: 196, blue: 182)
    static let lightGray = UIColor.rgb(red: 255, green: 255, blue: 255)
    static let selectedButton = UIColor.rgb(red: 45, green: 106, blue: 79)
    static let shareColor = UIColor(white: 0, alpha: 0.1)
    static let greenColor = UIColor.rgb(red: 64, green: 145, blue: 108)
    static let lightGreen = UIColor.rgb(red: 191, green: 241, blue: 237)
    static let lightBlue = UIColor.rgb(red: 218, green: 242, blue: 253)
    static let tealColor = UIColor.rgb(red: 148, green: 210, blue: 189)
    static let peachColor = UIColor.rgb(red: 255, green: 239, blue: 232)
    static let pinkColor = UIColor.rgb(red: 249, green: 162, blue: 175)
    static let lavendarColor = UIColor.rgb(red: 231, green: 223, blue: 251)
    static let defaultGray = UIColor.systemGray
    static let calendarGray = UIColor.rgb(red: 214, green: 229, blue: 227)
    static let dailyQuoteColor = UIColor.rgb(red: 237, green: 246, blue: 249)
    static let darkGray = UIColor.rgb(red: 240, green: 245, blue: 250)
    
}

extension UIImage {
    
    static let deleteImage = UIImage(systemName: "xmark.app")
    static let removeImage = UIImage(systemName: "xmark")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 15))
    static let settingImage = UIImage(systemName: "gear")
    static let saveImage = UIImage(systemName: "square.and.arrow.down")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 15))
    static let editImage = UIImage(systemName: "pencil.tip.crop.circle")
    static let homeImage = UIImage(systemName: "house.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let reflectionImage = UIImage(systemName: "shared.with.you")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let goalImage = UIImage(systemName: "target")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let noteImage = UIImage(systemName: "doc")
    static let diaryImage = UIImage(systemName: "square.and.pencil")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    
    static let calendarImage = UIImage(systemName: "calendar")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let notificationImage = UIImage(systemName: "bell")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let addImage = UIImage(systemName: "plus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 18, weight: .bold))
    static let backImage = UIImage(systemName: "chevron.left")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let paperClipImage = UIImage(systemName: "paperclip")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
    
    static let pinImage = UIImage(named: "pin")?.withRenderingMode(.alwaysOriginal)
    static let heart = UIImage(systemName: "heart.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 33))
    
    static let heartCircle = UIImage(systemName: "heart.circle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 90))
    static let rightArrow = UIImage(systemName: "arrow.right.circle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let lastMonthArrow = UIImage(systemName: "chevron.backward")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    static let nextMonthArrow = UIImage(systemName: "chevron.forward")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 21))
    
    
}



extension UIViewController {
    
    func configureBackButton() {
        
        let backButton = UIButton(type: .system)
        backButton.setImage(.backImage, for: .normal)
        backButton.tintColor = .greenColor 
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 66,
                          paddingLeft: 20,
                          width: 33,
                          height: 33)
        backButton.addTarget(self, action: #selector(handleBackButton),
                             for: .touchUpInside)
        
    }
    func configureCacelButton() {
        
        let backButton = UIButton(type: .system)
        backButton.setImage(.removeImage, for: .normal)
        backButton.tintColor = .greenColor
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 66,
                          paddingLeft: 20,
                          width: 33,
                          height: 33)
        backButton.addTarget(self, action: #selector(handleCancelButton),
                             for: .touchUpInside)
        
    }
    
    func configureAddButton() {
        let addButton = UIButton(type: .system)
        addButton.setImage(.addImage, for: .normal)
        addButton.tintColor = .white
        addButton.backgroundColor = .greenColor
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 36/2
        addButton.anchor(top: view.topAnchor,
                         right: view.rightAnchor,
                          paddingTop: 66,
                          paddingRight: 20,
                          width: 36,
                          height: 36)
        addButton.addTarget(self, action: #selector(handleBackButton),
                            for: .touchUpInside)
        
    }

    
    func configureTitleString(_ title: String, font: UIFont? = .titleFontMedium) {
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .label
        
        titleLabel.font = font
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .defaultColor
        
        let titleView = UIView()
        titleView.backgroundColor = .defaultColor
        
        let stackView = UIStackView(arrangedSubviews: [titleView, titleLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: 1, height: 111)
        
        
    }
    func configureHomeTabBar() {
        
        let customeHomeTabView = CustomeTabView()
        view.addSubview(customeHomeTabView)
      //  customeHomeTabView.delegate = self
        customeHomeTabView.anchor(left: view.leftAnchor,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                  right: view.rightAnchor,
                                  paddingLeft: 30,
                                  paddingBottom: 20,
                                  paddingRight: 30,
                                  height: 60)
        
    }
    @objc private func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    @objc private func handleAddButton() {
        
    }
    @objc private func handleCancelButton() {
        self.dismiss(animated: true)
    }
    func configureViewController(_ controller: UICollectionViewController) {
    
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func handleAddGradientLayer(_ inputView: UIView, color1: UIColor, color2: UIColor) -> UIView {
      
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        inputView.layer.addSublayer(gradientLayer)
        
        return inputView
    }
  
}

