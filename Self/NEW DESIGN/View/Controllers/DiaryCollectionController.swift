//
//  DiaryCollectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 9/20/22.
//

import UIKit
import CoreData

class DiaryCollectionController: UICollectionViewController {
    
    var diary: Array<NSManagedObject> = []
    
    private lazy var navigationView = CustomNavigationView(titleString: "My Diary",
                                                      image: .addImage!, delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        //fetchData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        diary.removeAll()
        fetchData()
    }
    
    private func configureUI() {
    
        navigationView.enableAddButton()
        view.addSubview(navigationView)
        navigationView.anchor(top: view.topAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor, height: 120)
        
        view.backgroundColor = .defaultColor
        collectionView.backgroundColor = .defaultColor
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: HomeCollectionCell.identifier)
        collectionView.register(ReminderCell.self, forCellWithReuseIdentifier: ReminderCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0)
        

    }
    private func fetchData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary")
       
        do {
            let sort = NSSortDescriptor(key: #keyPath(Goals.time), ascending: true)
            fetchRequest.sortDescriptors = [sort]
            
            let fetchResult = try manageContext.fetch(fetchRequest)
           
            for data in fetchResult as! [NSManagedObject] {
                
                self.diary.append(data)

                self.collectionView.reloadData()
            }
            
        } catch {
            print("Fail to catch the data")
        }
    }
    
}

extension DiaryCollectionController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
            return diary.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.identifier, for: indexPath) as! HomeCollectionCell
        cell.delegate = self
        cell.data = diary[indexPath.item]
        cell.index = indexPath.row
        guard let text = diary[indexPath.item].value(forKey: "diary") as? String else {return cell}
        cell.contentLabel.text =  text
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = EachDiaryController()
        vc.data = diary[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
extension DiaryCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
            return CGSize(width: view.frame.width, height: 150)
        
    }

}
extension DiaryCollectionController: CustomNavigationViewDelegate {
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        let vc = AddDiaryController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}

extension DiaryCollectionController: HomeCollecionCellDelegate {
    func homeCollectionCell(_ cell: HomeCollectionCell, data: NSManagedObject, index: Int) {
      
        let itemData = data
     
        self.diary.remove(at: index)
        
        Service.deleteCoreDataContent(index: index, itemData: itemData,
                                      collectionView: self.collectionView)
        
        
    }
    
    
}
