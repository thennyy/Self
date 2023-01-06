//
//  EachReflectionViewFooter.swift
//  Self
//
//  Created by Thenny Chhorn on 9/29/22.
//

import UIKit

class EachReflectionViewFooter: UICollectionViewCell {
    
    static let identifier = "eachReflectionViewFooter"
   
    var viewModel: ReflectionViewModel! {
        didSet{
            
            configureData()
        }
    }
    
    private let statementLabel: UILabel = {
        
        let label = UILabel()
        label.text = "How could you make today better?"
        label.font = .titleFontLight
        label.textColor = .label
        return label
        
    }()
    
    lazy var textLabel: UILabel = {
        
        let tv = UILabel()
        tv.font = .regFont
        tv.textColor = .label
        tv.layer.cornerRadius = 6
        tv.numberOfLines = 0
        tv.backgroundColor = .defaultColor
        return tv
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        
        backgroundColor = .defaultColor
        
        contentView.addSubview(statementLabel)
        statementLabel.anchor(top: contentView.topAnchor,
                              left: contentView.leftAnchor,
                              right: contentView.rightAnchor,
                              paddingTop: 30,
                              paddingLeft: 20)
                        
        
        contentView.addSubview(textLabel)
        textLabel.anchor(top: statementLabel.bottomAnchor,
                         left: contentView.leftAnchor,
                         bottom: contentView.bottomAnchor,
                         right: contentView.rightAnchor,
                         paddingTop: 30,
                         paddingLeft: 20,
                         paddingRight: 20)
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureData() {
        
        textLabel.text = viewModel.reflectionText
        
    }
}
