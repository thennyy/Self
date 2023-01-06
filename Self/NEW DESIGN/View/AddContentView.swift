//
//  AddMoodReflectionView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/29/22.
//

import UIKit

protocol AddContentViewDelegate: AnyObject {
    func addContentView(_ view: AddContentView, textView: UITextView)
}

class AddContentView: UIView {
    
    private weak var delegate: AddContentViewDelegate?
    
    private let blankView = UIView()
    private lazy var scrollView = CustomScrollView(firstArrangeView: textView,
                                                   secondView: blankView)
    
    private lazy var textView: UITextView = {
        
        let tv = UITextView()
        tv.font = .mediumFont
        tv.layer.cornerRadius = 6
        tv.isScrollEnabled = false
        tv.clipsToBounds = true
        tv.delegate = self
        tv.backgroundColor = .defaultColor
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    private let startTextLabel: UILabel = {
        let label = UILabel()
        label.font = .mediumFont
        label.textColor = .gray
        label.text = "Start here"
        return label
    }()
    
    convenience init(delegate: AddContentViewDelegate) {
        self.init()
        self.delegate = delegate
        addSubview(scrollView)
        scrollView.anchor(top: topAnchor,
                          left: leftAnchor,
                          bottom: bottomAnchor,
                          right: rightAnchor,
                          paddingTop: 9, paddingLeft: 9,
                          paddingRight: 9)

        addSubview(startTextLabel)
        startTextLabel.anchor(top: scrollView.topAnchor,
                              left: leftAnchor,
                              paddingTop: 6,
                              paddingLeft: 15,
                              height: 30)
        
        
        
    }
    
    func dismissTextView() {
        textView.resignFirstResponder()
    }
  
    
}
extension AddContentView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty == false {
            startTextLabel.isHidden = true
        }else {
            startTextLabel.isHidden = false
        }
        delegate?.addContentView(self, textView: textView)
    }
   
}
