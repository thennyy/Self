//
//  AddNewGoalController.swift
//  Self
//
//  Created by Thenny Chhorn on 1/20/21.
//

import UIKit
import CoreData

class AddNewGoalController: UIViewController, UIScrollViewDelegate {
    
    var savedGoalText = false
    private var savedDiary = false
    private var textString: String?
    
    private lazy var navigationView = CustomNavigationView(titleString: "Write Goal",
                                                           image: .saveImage!,
                                                           delegate: self)
    
    private lazy var addContentView = AddContentView(delegate: self)
  
    // MARK: - Lifecycle
    
     override func viewDidLoad() {
         super.viewDidLoad()
         
         configureUI()
    
     }

    // MARK: - Helpers
    fileprivate func configureUI() {
        
         view.backgroundColor = .defaultColor
         view.addSubview(navigationView)
         navigationView.anchor(top: view.topAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               height: 120)
  
         let lineView = UIView()
         lineView.backgroundColor = UIColor(white: 0, alpha: 0.1)
         view.addSubview(lineView)
         lineView.anchor(top: navigationView.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         height: 1)
         

         
         view.addSubview(addContentView)
        addContentView.anchor(top: lineView.bottomAnchor,
                          left: view.leftAnchor,
                          bottom: view.bottomAnchor,
                          right: view.rightAnchor,
                          paddingTop: 9, paddingLeft: 9,
                          paddingRight: 9)


     }
     
    
     fileprivate func alertEmptyText() {
         
         let alert = UIAlertController(title: "Empty Text",
                                       message: "Please fill in the text",
                                       preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Dismiss",
                                       style: .default,
                                       handler: nil))
         self.present(alert, animated: true, completion: nil)
         
     }

     
     fileprivate func addNewGoal() {

        guard let text = textString else {return}
        Service.handleSaveGoalData(contentName: text)
        // savedGoalText = true
         addContentView.dismissTextView()
     }

}

// MARK: - CustomNavigationViewDelegate

extension AddNewGoalController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        if savedGoalText == false  {
            addNewGoal()
           // savedGoalText = true
            addContentView.dismissTextView()
        }
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }

}

    // MARK: - AddContentViewDelegate
extension AddNewGoalController: AddContentViewDelegate {
    
    func addContentView(_ view: AddContentView, textView: UITextView) {
        if textView.text.isEmpty == false {
            navigationView.enableAddButton()
            textString = textView.text
        }else {
            navigationView.disableAddButton()
        }
    }
    
    
}
