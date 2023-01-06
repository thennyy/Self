//
//  EachDiaryController.swift
//  Self
//
//  Created by Thenny Chhorn on 1/24/21.
//

import UIKit
import CoreData

class EachDiaryController: UIViewController {
    
    
    // MARK: - Properties
    var dateString: String?
    var data: NSManagedObject!
    var index: Int?
    var textString: String!
    
    private lazy var navigationView = CustomNavigationView(titleString: "My Diary",
                                                  image: .saveImage!,
                                                  delegate: self)
    private var eachView = EachView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.delegate = self
        eachView.viewModel = EachViewViewModel(rawData: data,
                                               type: .diary)
        eachView.delegate = self
        configureUI()
        
    }
 
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .defaultColor
        
         view.addSubview(navigationView)
         
         
         navigationView.anchor(top: view.topAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               height: 120)

         view.addSubview(eachView)
  
         eachView.anchor(top: navigationView.bottomAnchor,
                           left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           paddingTop: 12,
                           paddingLeft: 9,
                           paddingRight: 9)
         

    }




}
    // MARK: - EachViewDelegate
extension EachDiaryController: EachViewDelegate {
    func eachView(_ view: EachView, text: String) {
        navigationView.enableAddButton()
        self.textString = text
    }

}

    // MARK: - CustomNavigationViewDelegate

extension EachDiaryController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        
        print("ADDED")
        if textString.isEmpty == false {
            Service.deleteCoreDataFromEachView(itemData: self.data)

            Service.handleSaveDiaryData(contentName: textString)

            navigationView.disableAddButton()
            eachView.disableTextView()
        }
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
