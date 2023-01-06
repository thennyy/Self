//
//  EachView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/27/22.
//

import UIKit
import CoreData

protocol EachViewDelegate: AnyObject {
    func eachView(_ view: EachView, text: String)
}

class EachView: UIView {
    
    // MARK: - Properties
    
    var viewModel: EachViewViewModel! {
        didSet{
            configureData()
        }
    }
    
    weak var delegate: EachViewDelegate?
    
    var data: NSManagedObject! {
        didSet {
          
        }
    }
    let blankView = UIView()
    private lazy var scrollView = CustomScrollView(firstArrangeView: textView,
                                                   secondView: blankView)

    private var dateLabel : UILabel = {
        
        let label = UILabel()
        label.textColor = .gray
        label.font = .mediumFont
        label.textAlignment = .center
        return label
        
    }()

    private lazy var textView: UITextView = {
        
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isScrollEnabled = false
        tv.font = UIFont.mediumFont
        tv.layer.cornerRadius = 6
        tv.backgroundColor = .defaultColor
        tv.delegate = self
        return tv
    }()
    

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .defaultColor
        
        blankView.heightAnchor.constraint(equalToConstant: 400).isActive = true
       
        addSubview(dateLabel)
        dateLabel.anchor(top: topAnchor,
                         left: leftAnchor,
                         right: rightAnchor,
                         height: 30)
        
//        let stackView = UIStackView(arrangedSubviews: [textView, blankView])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 9
//        stackView.distribution = .fill
        
        addSubview(scrollView)
        scrollView.anchor(top: dateLabel.bottomAnchor,
                          left: leftAnchor,
                          bottom: bottomAnchor,
                          right: rightAnchor)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Helpers
    func configureData() {
        textView.text = viewModel.value
        dateLabel.text = viewModel.date
        
    }
    func disableTextView() {
        textView.resignFirstResponder()
    }
}
    // MARK: - UITextViewDelegate

extension EachView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
         print("DEBUG: CUSTOM NAVIATION VIEW")
        delegate?.eachView(self, text: textView.text)
        
    }
}
