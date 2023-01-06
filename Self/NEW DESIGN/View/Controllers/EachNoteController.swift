//
//  EachNoteController.swift
//  Self
//
//  Created by Thenny Chhorn on 1/24/21.
//

import UIKit
import CoreData

class EachNoteControlelr: UIViewController {
   
    var dateString: String?
    var data: NSManagedObject!
    var index: Int?
    var textString: String!
    
    private lazy var navigationView = CustomNavigationView(titleString: "My Note",
                                                  image: .saveImage!)

    private var eachView = EachView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView.delegate = self
        eachView.delegate = self
        eachView.viewModel = EachViewViewModel(rawData: data,
                                               type: .note)
        
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

    fileprivate func deleteData() {
        guard let itemData = data else {return}
        Service.deleteCoreDataFromEachView(itemData: itemData)
        
    }


}

    // MARK: - CustomNavigationViewDelegate

extension EachNoteControlelr: CustomNavigationViewDelegate {
   
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        
        print("ADDED")
        if textString.isEmpty == false {
          
            Service.handleSaveNoteData(contentName: textString)
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

extension EachNoteControlelr: EachViewDelegate {
    func eachView(_ view: EachView, text: String) {
        navigationView.enableAddButton()
        self.textString = text
    }

}

