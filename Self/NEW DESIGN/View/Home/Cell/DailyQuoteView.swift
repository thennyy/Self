//
//  DailyQuoteCell.swift
//  Self
//
//  Created by Thenny Chhorn on 9/15/22.
//

import UIKit
import CoreData

protocol DailyQuoteViewDelegate: AnyObject {
    func dailyQuoteView(_ view: DailyQuoteView, pinButton: UIButton)
    func dailyQuoteView(_ view: DailyQuoteView, unPinnedButton: UIButton)
}

class DailyQuoteView: UIView {
    
    // MARK: - Properties
    static let identifier = "dailyQuoteCell"
    
    weak var delegate: DailyQuoteViewDelegate?
    
    private var isPinned = false
    private var savedQuote: QuoteModel?
    private var savedData: NSManagedObject? = nil
    private var quoteModel = [QuoteModel]()
    
    private let backgroundView: UIView = {
        let view = UIView()
       // view.layer.borderColor = UIColor.gray.cgColor
      //  view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 30
        view.layer.shadowRadius = 12
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.gray.cgColor
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily Quote"
        label.font = .mediumFont
        label.textColor = .black
        return label
    }()
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.font = .quoteFontRegular
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .regLight
        label.textColor = .black
        return label
    }()
 
    private let pinButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.heartCircle, for: .normal)
        button.backgroundColor = .defaultColor
        button.layer.cornerRadius = 60/2
        button.tintColor = .greenColor
        button.layer.shadowRadius = 6
        button.layer.shadowOpacity = 0.3

        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
  
      
        fetchJsonQuotes()
        configureRandomQuote()
        
        configureBackGroundView()
                
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configureUI() {
        
      //  backgroundColor = .defaultColor
        addSubview(backgroundView)
        backgroundView.anchor(top: topAnchor,
                              left: leftAnchor, bottom: bottomAnchor,
                              right: rightAnchor,
                              paddingTop: 20)
                     
        backgroundView.addSubview(titleLabel)
        titleLabel.setDimensions(height: 30, width: 120)
        titleLabel.centerX(inView: backgroundView,
                           topAnchor: backgroundView.topAnchor,
                           paddingTop: 20)
        
        backgroundView.addSubview(quoteLabel)
        quoteLabel.anchor(top: titleLabel.bottomAnchor,
                          left: backgroundView.leftAnchor,
                          right: backgroundView.rightAnchor,
                          paddingTop: 20,
                          paddingLeft: 20,
                          paddingRight: 20)
        
        backgroundView.addSubview(authorLabel)
        authorLabel.anchor(top: quoteLabel.bottomAnchor,
                           right: quoteLabel.rightAnchor,
                           paddingTop: 20, paddingRight: 20)
        
        addSubview(pinButton)
        pinButton.anchor(top: backgroundView.topAnchor,
                         right: backgroundView.rightAnchor,
                         paddingTop: -15,
                         paddingRight: -6, width: 60, height: 60)
        
        pinButton.addTarget(self, action: #selector(handlePinButton),
                            for: .touchUpInside)
        
    }
    
    private func fetchJsonQuotes() {
        
        ServiceJson.getJSONFile(forName: "Quote") { quote in

            self.quoteModel.append(contentsOf: quote)
        }
    }
    private func configureRandomQuote() {
    
//        Service.fetchSavedQuote { quote in
//            self.savedQuote = quote
//        }
        if savedQuote?.quote.isEmpty == false {
           
            self.quoteLabel.text = savedQuote?.quote as? String ?? ""
            self.authorLabel.text = savedQuote?.author as? String ?? ""
            self.isPinned = true
            
        }else {
            
            guard let quote = self.quoteModel.randomElement() else {return}
            
            self.savedQuote = quote
            self.quoteLabel.text = quote.quote
            self.authorLabel.text = quote.author
            self.isPinned = false
            
        }
 
    }
    
    @objc func handlePinButton(_ sender: UIButton) {
        
        if isPinned == false {
            pinnedQuote(sender: sender)
            isPinned = true
        }else {
            unPinnedQuote(sender: sender)
            isPinned = false
        }
    }
    private func pinnedQuote(sender: UIButton)  {
       
        isPinned = true
        let quote = savedQuote?.quote as? String ?? ""
        let author = savedQuote?.author as? String ?? ""
        let quoteModel = QuoteModel(quote: quote, author: author)
        
        Service.saveQuote(quoteModel)
        configureBackGroundView()
        delegate?.dailyQuoteView(self, pinButton: sender)
      
    }
    private func unPinnedQuote(sender: UIButton) {

        isPinned = false
        Service.unSaveQuote()
        configureBackGroundView()

        delegate?.dailyQuoteView(self, unPinnedButton: sender)
        
    }
    private func configureBackGroundView() {
        if isPinned == false {
            backgroundView.backgroundColor = .defaultColor
            pinButton.tintColor = .greenColor
            quoteLabel.textColor = .black
            authorLabel.textColor = .black
            titleLabel.textColor = .black
        }else {
            backgroundView.backgroundColor = .greenColor
            pinButton.tintColor = .systemRed
            quoteLabel.textColor = .white
            authorLabel.textColor = .white
            titleLabel.textColor = .white
        }
    }
}
