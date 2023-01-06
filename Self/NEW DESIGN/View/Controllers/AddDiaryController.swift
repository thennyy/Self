//
//  AddDiaryController.swift
//  Self
//
//  Created by Thenny Chhorn on 1/21/21.
//

import UIKit
import CoreData
class AddDiaryController: UIViewController, UIScrollViewDelegate {
   
    // MARK: - Properties
    private var savedDiary = false
    private var textString: String?
    
    private lazy var navigationView = CustomNavigationView(titleString: "Write Diary",
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

     static var notificaton = NSNotification.Name("notificationDiary")
     
     fileprivate func addNewGoal() {

        guard let text = textString else {return}
        Service.handleSaveDiaryData(contentName: text)
        
     }

}

// MARK: - CustomNavigationViewDelegate

extension AddDiaryController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        if savedDiary == false  {
            addNewGoal()
            savedDiary = true
        }
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }

}

    // MARK: - AddContentViewDelegate
extension AddDiaryController: AddContentViewDelegate {
    
    func addContentView(_ view: AddContentView, textView: UITextView) {
        if textView.text.isEmpty == false {
            navigationView.enableAddButton()
            textString = textView.text
        }else {
            navigationView.disableAddButton()
        }
    }
    
    
}
