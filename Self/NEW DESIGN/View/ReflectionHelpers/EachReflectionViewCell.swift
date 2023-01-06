//
//  EachReflectionViewCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/29/22.
//

import UIKit

class EachReflectionViewCell: UICollectionViewCell {
    
    static let identifier = "eachReflectionCell"
    
    var viewModel: ReflectionViewModel! {
        didSet{
            
            configureData()
        }
    }
    
    private lazy var questionLabel: UILabel = {
        
        let label = UILabel()
        label.font = .mediumFont
        label.textColor = .label
    
        return label
    }()
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = .regFont
        label.textColor = .gray
        return label
    }()
    
    private lazy var scrollView = CustomScrollView(firstArrangeView: questionLabel,
                                                   secondView: answerLabel)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        backgroundColor = .defaultColor
        
        let backGroundView = UIView()
        
        backGroundView.backgroundColor = .defaultColor
        backGroundView.layer.borderColor = UIColor.gray.cgColor
        backGroundView.layer.borderWidth = 0.5
        backGroundView.layer.cornerRadius = 20
        
        contentView.addSubview(backGroundView)
        backGroundView.anchor(top: contentView.topAnchor,
                              left: contentView.leftAnchor,
                              bottom: contentView.bottomAnchor,
                              right: contentView.rightAnchor,
                              paddingLeft: 20, paddingRight: 20)
        

        addSubview(scrollView)
        scrollView.anchor(top: backGroundView.topAnchor,
                          left: backGroundView.leftAnchor,
                          bottom: backGroundView.bottomAnchor,
                          right: backGroundView.rightAnchor,
                          paddingTop: 20,
                          paddingLeft: 20,
                          paddingBottom: 20,
                          paddingRight: 20)
        
    }
    
    private func configureData() {
        
        questionLabel.text = viewModel.question
        answerLabel.text = viewModel.answer
    }
}
