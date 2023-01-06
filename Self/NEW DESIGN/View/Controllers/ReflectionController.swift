//
//  ReflectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 9/19/22.
//

import UIKit
import CoreData

class ReflectionController: UICollectionViewController  {
    
    private let addButton = CustomizedButton()
    var reflectionText: Array<NSManagedObject> = []
    
    
    private lazy var navigationView = CustomNavigationView(titleString: "All Reflections",
                                                           image: .addImage!,
                                                           delegate: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchData()
        
    }
    
    private func configureUI() {
        
        navigationView.enableAddButton()
        view.backgroundColor = .defaultColor
      
        view.addSubview(navigationView)
        navigationView.anchor(top: view.topAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor, height: 120)
        
        collectionView.backgroundColor = .defaultColor 
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: HomeCollectionCell.identifier)
        collectionView.register(ReminderCell.self, forCellWithReuseIdentifier: ReminderCell.identifier)

        collectionView.contentInset = UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0)
        
        
    }
    
    @objc fileprivate func handleStartButton() {
        let vc = AddReflectionController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData() {
       
        Service.fetchData(entity: "Reflection", storage: "reflectText") { data in
            
            self.reflectionText.append(data)
            
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Reflection")
       
        do {
            let sort = NSSortDescriptor(key: #keyPath(Reflection.time), ascending: true)
            fetchRequest.sortDescriptors = [sort]
            
            let fetchResult = try manageContext.fetch(fetchRequest)
           
            for data in fetchResult as! [NSManagedObject] {
                
                self.reflectionText.append(data)

                self.collectionView.reloadData()
                
            }
            
        } catch {
            print("Fail to catch the data")
        }
    }
    
}

extension ReflectionController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reflectionText.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.identifier, for: indexPath) as! HomeCollectionCell
        cell.data = reflectionText[indexPath.item]
        cell.delegate = self
        cell.index = indexPath.row
        guard let text = reflectionText[indexPath.item].value(forKey: "reflectText") as? String else {return cell}
        cell.contentLabel.text =  text
        
        return cell
        
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let vc = EachReflectionController(collectionViewLayout: layout)
       
        let data: NSManagedObject = reflectionText[indexPath.row]
        vc.data = data 
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ReflectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: view.frame.width, height: 150)
    }

}
    // MARK: - CustomNavigationViewDelegate

extension ReflectionController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        let layout = UICollectionViewFlowLayout()
        let vc = AddReflectionController(collectionViewLayout: layout)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension ReflectionController: HomeCollecionCellDelegate {
    
    func homeCollectionCell(_ cell: HomeCollectionCell, data: NSManagedObject, index: Int) {
 
        let itemData = data
     
        self.reflectionText.remove(at: index)
        
        Service.deleteCoreDataContent(index: index, itemData: itemData,
                                      collectionView: self.collectionView)
        

    }
}
