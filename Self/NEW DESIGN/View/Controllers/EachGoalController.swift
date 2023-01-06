//
//  EachGoalController.swift
//  Self
//
//  Created by Thenny Chhorn on 1/24/21.
//

import UIKit
import CoreData

class EachGoalController: UIViewController  {
    
    // MARK: - Properties
    
    var data: NSManagedObject! 
    var index: Int?
    var textString: String!
    
    private lazy var navigationView = CustomNavigationView(titleString: "My Goal",
                                                           image: .saveImage!,
                                                           tintColor: .white,
                                                           delegate: self)
    
    private var eachView = EachView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.delegate = self
        eachView.viewModel = EachViewViewModel(rawData: data, type: .goal)
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

    // MARK: - CustomNavigationViewDelegate

extension EachGoalController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        
        if textString.isEmpty == false {
           
            Service.handleSaveGoalData(contentName: textString)
            Service.deleteCoreDataFromEachView(itemData: self.data)
            navigationView.disableAddButton()
            eachView.disableTextView()
        }
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
 
}
// MARK: - EachViewDelegate

extension EachGoalController: EachViewDelegate {
    func eachView(_ view: EachView, text: String) {
        navigationView.enableAddButton()
        self.textString = text
    }

}
