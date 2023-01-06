//
//  AddReflectCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/14/22.
//

import UIKit
protocol AddReflectionViewDelegate: AnyObject {
    func addReflectionView(_ view: AddReflectionView, startButton: CustomizedButton)
}
class AddReflectionView: UIView {
    
    static let identifier = "addReflectionCell"
    
    private weak var delegate: AddReflectionViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Reflect on your day"
        label.font = .mediumFont
        label.textColor = .black
        return label
    }()
    
    private lazy var startButton: UIButton = {
       // let button = CustomizedButton(type: .system)
        let button = UIButton(type: .system)
        button.titleLabel?.font = .mediumFont
        button.backgroundColor = .greenColor
        button.tintColor = .white
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(handleStartButton),
                         for: .touchUpInside)
 
        return button
    }()

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
    convenience init(delegate: AddReflectionViewDelegate) {
        self.init()
        self.delegate = delegate
        
        backgroundColor = .shareColor
     //   layer.borderColor = UIColor.gray.cgColor
      //  layer.borderWidth = 0.5
        
        startButton.setTitle("Start", for: .normal)
        
        addSubview(titleLabel)
        titleLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 30)
        
        addSubview(startButton)
        startButton.setDimensions(height: 40, width: 90)
        startButton.layer.cornerRadius = 40/2

        startButton.centerY(inView: self, rightAnchor: rightAnchor, paddingRight: 15)
        
        startButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    @objc func handleStartButton(_ sender: CustomizedButton) {
        print("DEBUG: START BUTTON")
        delegate?.addReflectionView(self, startButton: sender)
    }
}
