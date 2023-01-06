//
//  AddReflectionCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/30/22.
//

import UIKit
protocol AddReflectionViewCellDelegate: AnyObject {
    
    func addReflecitonViewCell(_ cell: AddReflectionViewCell,
                               segmentControl: UISegmentedControl,
                               segmentValue: String, index: Int,
                               questions: QuestionSection)
    
}
class AddReflectionViewCell: UICollectionViewCell {
    
    static let identifier = "AddReflectionCell"
    var index = 0
    
    weak var delegate: AddReflectionViewCellDelegate?
    
    var viewModel: AddReflectionViewModel! {
        didSet {
            
            configureData()
            
        }
    }
    
    private lazy var segmentControl: UISegmentedControl = {
        
        let segment = UISegmentedControl()
        segment.addTarget(self, action: #selector(handleSegmentControl), for: .valueChanged)
        return segment
    }()
    private lazy var questionLabel: UILabel = {
        
        let label = UILabel()
        label.font = .mediumFont
        label.textColor = .label
    
        return label
        
    }()
                                            
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        backgroundColor = .defaultColor
      
        segmentControl.layer.borderWidth = 0.5
        segmentControl.layer.borderColor = UIColor.defaultGray.cgColor
     
        segmentControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
        
        let backGroundView = UIView()
        
        backGroundView.backgroundColor = .defaultColor
        backGroundView.layer.borderColor = UIColor.gray.cgColor
       // backGroundView.layer.borderWidth = 0.5
        //backGroundView.layer.cornerRadius = 20
        
        contentView.addSubview(backGroundView)
        backGroundView.anchor(top: contentView.topAnchor,
                              left: contentView.leftAnchor,
                              bottom: contentView.bottomAnchor,
                              right: contentView.rightAnchor,
                              paddingLeft: 20, paddingRight: 20)
        
        let stackView = UIStackView(arrangedSubviews: [questionLabel, segmentControl])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        contentView.addSubview(stackView)
        stackView.centerY(inView: self,
                          leftAnchor: backGroundView.leftAnchor,
                          rightAnchor: backGroundView.rightAnchor,
                          paddingLeft: 20,
                          paddingRight: 20)

        
    }
    
    fileprivate func configureData() {
        
        questionLabel.text = viewModel.questionString
        
        let strings = viewModel.answers.answerDecription
        strings.enumerated().forEach {
            segmentControl.insertSegment(withTitle: $1, at: $0, animated: false)
        }
        let font = UIFont.mediumFont
        let textAttribute = [NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: UIColor.label]
        
        segmentControl.setTitleTextAttributes(textAttribute, for: .normal)
        
    }
    @objc private func handleSegmentControl(_ segment: UISegmentedControl) {
        
        let segmentIndex = segment.selectedSegmentIndex
        let value = segment.titleForSegment(at: segmentIndex) ?? ""
       
        delegate?.addReflecitonViewCell(self, segmentControl: segment,
                                        segmentValue: value,
                                        index: index,
                                        questions: viewModel.questions)
        
    }
}
