//
//  GoalCollectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 9/20/22.
//

import UIKit
import CoreData

class GoalCollectionController: UICollectionViewController {
    
    private var goals: Array<NSManagedObject> = []
    
    private lazy var navigationView = CustomNavigationView(titleString: "Goals",
                                                           image: .addImage!,
                                                           delegate: self)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
   
      //  fetchData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        goals.removeAll()
        fetchData()
        
    }
    // MARK: - Helpers
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
    // MARK: - FetchData
    private func fetchData() {
  
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goals")
       
        do {
            let sort = NSSortDescriptor(key: #keyPath(Goals.time), ascending: true)
            fetchRequest.sortDescriptors = [sort]
            
            let fetchResult = try manageContext.fetch(fetchRequest)
           
            for data in fetchResult as! [NSManagedObject] {
                
                self.goals.append(data)
                self.collectionView.reloadData()
            }
            
        } catch {
            print("Fail to catch the data")
        }
    }
    @objc private func handleAddButtonSelected() {
        
        let vc = AddNewGoalController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
    // MARK: - CollectionViewDatasource

extension GoalCollectionController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return goals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.identifier, for: indexPath) as! HomeCollectionCell
        cell.delegate = self
        cell.index = indexPath.row
        cell.data = goals[indexPath.item]
        guard let text = goals[indexPath.item].value(forKey: "goal") as? String else {return cell}
        cell.contentLabel.text =  text
        
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = EachGoalController()
        vc.data = goals[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }

}
    // MARK: - UICollectionViewDelegateFlowLayout
extension GoalCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
        return CGSize(width: view.frame.width, height: 150)
    }

}
    // MARK: - CustomNavigationViewDelegate
extension GoalCollectionController: CustomNavigationViewDelegate {

    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        let vc = AddNewGoalController()
        navigationController?.pushViewController(vc,  animated: true)
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    
}
    // MARK: - HomeCollecionCellDelegate
extension GoalCollectionController: HomeCollecionCellDelegate {
   
    func homeCollectionCell(_ cell: HomeCollectionCell, data: NSManagedObject, index: Int) {
 
        let itemData = data
     
        self.goals.remove(at: index)
        
        Service.deleteCoreDataContent(index: index, itemData: itemData,
                                      collectionView: self.collectionView)
        

    }
  

}
