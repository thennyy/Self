//
//  EachReflectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 1/24/21.
//

import UIKit
import CoreData

class EachReflectionController: UICollectionViewController {
    
    var dateString: String?
    var data: NSManagedObject!
    var index: Int?
    var textString: String!
    
    private lazy var navigationView = CustomNavigationView(titleString: "My Reflection",
                                                           imageBackgroundColor: .defaultColor,
                                                           delegate: self)
    
    
    
    private var dateLabel : UILabel = {
        
        let label = UILabel()
        label.textColor = .gray
        label.font = .mediumFont
        label.textAlignment = .center
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        guard let date = data.value(forKey: "date") as? String else {return}
        dateLabel.text = date
    }
    
    private func configureUI() {
        
        view.backgroundColor = .defaultColor
        
         view.addSubview(navigationView)
         
         navigationView.anchor(top: view.topAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               height: 120)
        
        
        view.addSubview(dateLabel)
        dateLabel.anchor(top: navigationView.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         height: 45)
        
        collectionView.backgroundColor = .defaultColor
        collectionView.register(EachReflectionViewCell.self, forCellWithReuseIdentifier: EachReflectionViewCell.identifier)
        collectionView.register(EachReflectionViewFooter.self, forCellWithReuseIdentifier: EachReflectionViewFooter.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 90+45, left: 0, bottom: 0, right: 0)
        
    }
    
}

extension EachReflectionController: CustomNavigationViewDelegate {
   
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension EachReflectionController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }else {
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let section = QuestionSection(rawValue: indexPath.row) else {return UICollectionViewCell() }
        
        let model = ReflectionModel(textData: data)
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EachReflectionViewCell.identifier, for: indexPath) as! EachReflectionViewCell
            
            cell.viewModel = ReflectionViewModel(reflection: model, section: section)
            
            return cell
            
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EachReflectionViewFooter.identifier, for: indexPath) as! EachReflectionViewFooter
           
            cell.viewModel = ReflectionViewModel(reflection: model, section: section)
            return cell
            
        }
    }
    
}
extension EachReflectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 111)
        }else {
            
            guard let section = QuestionSection(rawValue: indexPath.row) else {return CGSize.zero}
            let model = ReflectionModel(textData: data)
            let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 60)
            let estimateSizeCell = EachReflectionViewFooter(frame: frame)
            estimateSizeCell.viewModel = ReflectionViewModel(reflection: model, section: section)
            estimateSizeCell.layoutIfNeeded()
            
            let targetSize = CGSize(width: view.frame.width, height: 1000)
            let estimatedSize = estimateSizeCell.systemLayoutSizeFitting(targetSize)
            
            return CGSize(width: view.frame.width, height: estimatedSize.height)
        }
    }
    
}

