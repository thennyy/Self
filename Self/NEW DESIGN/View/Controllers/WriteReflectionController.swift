//
//  WriteReflectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 4/21/22.
//

import UIKit
//import JGProgressHUD
protocol WriteReflectionControllerDelegate: AnyObject {
    func writeReflectionController(_ controller: WriteReflectionController)
}
class WriteReflectionController: UIViewController {
    
    // MARK: - Properties
    var answerStrings = [String]()
    
    weak var delegate: WriteReflectionControllerDelegate?
    
    private lazy var navigationView = CustomNavigationView(titleString: "My Reflection",
                                                           image: .saveImage!,
                                                           backImage: .removeImage!,
                                                           delegate: self)
    
    private let blankView = UIView()
    private lazy var scrollView = CustomScrollView(firstArrangeView: textView,
                                                   secondView: blankView)
    
    private let textLabel: UILabel = {
        
        let label = UILabel()
        label.text = "How could you make today better?"
        label.font = .mediumLight
        label.textColor = .label
        
        return label
    }()
    private let doneBtn: UIButton = {
        
        let button = UIButton()
        button.titleLabel?.font = .mediumFont
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.gray, for: .normal)

        return button
        
    }()
    private let textView: UITextView = {
        
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = .regFont
        tv.textColor = .label
        tv.isScrollEnabled = false
        tv.layer.cornerRadius = 6
        tv.clipsToBounds = true
        tv.backgroundColor = .systemGroupedBackground
        return tv
    }()
    private let startTextLabel: UILabel = {
        let label = UILabel()
        label.font = .regFont
        label.textColor = .gray
        label.text = "Text here"
        return label
    }()
    private let scrolView: UIScrollView = {
        let scrolView = UIScrollView()
        scrolView.isScrollEnabled = true
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        return scrolView
    }()
    // MARK: - Lifecycle
     override func viewDidLoad() {
       super.viewDidLoad()
        
         textView.delegate = self
        
         configureUI()
                  
    }
    // MARK: - Helpers
    fileprivate func configureUI() {
        
        view.backgroundColor = .defaultColor

        view.addSubview(navigationView)
        navigationView.anchor(top: view.topAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor, height: 120)
   
        view.addSubview(textLabel)
        textLabel.anchor(top: navigationView.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 20,
                         paddingRight: 12,
                         height: 30)
        
        view.addSubview(scrollView)
       scrollView.anchor(top: textLabel.bottomAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingTop: 9, paddingLeft: 9,
                         paddingRight: 9)

       view.addSubview(startTextLabel)
       startTextLabel.anchor(top: scrollView.topAnchor,
                             left: scrollView.leftAnchor,
                             paddingTop: 9,
                             paddingLeft: 6)
                             
       
    }
  
    @objc func handleDoneBtn(){
        guard  textView.text != nil else {
            alertEmptyText()
            return}
        Service.handleSaveReflectionData(answersString: answerStrings,
                                         text: textView.text)
        
        
    }
  
    fileprivate func alertEmptyText() {
        
        let alert = UIAlertController(title: "Empty Text", message: "Please fill in the text", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
// MARK: - UITextViewDelegate
extension WriteReflectionController: UITextViewDelegate {
   
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty == false {
            startTextLabel.isHidden = true
            navigationView.enableAddButton()
        }else {
            startTextLabel.isHidden = false
            navigationView.disableAddButton()
        }
    }

}
extension WriteReflectionController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        
        if textView.text.isEmpty == false {
          
            handleDoneBtn()
            
            navigationView.disableAddButton()
            textView.isEditable = false
       
            delegate?.writeReflectionController(self)
        }
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        self.dismiss(animated: true)
    }
    
    
}
extension WriteReflectionController: AddReflectionControllerDelegate {
  
    func addReflectionController(_ controller: AddReflectionController,
                                 answers: [String]) {
                          
        
       
        print(answers)
        answerStrings = answers
   
    }

}

