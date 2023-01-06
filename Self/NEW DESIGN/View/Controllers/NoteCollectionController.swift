//
//  NoteCollectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 9/20/22.
//

import UIKit
import CoreData

class NoteCollectionController: UICollectionViewController {
    
    var notes: Array<NSManagedObject> = []
    
    private lazy var navigationView = CustomNavigationView(titleString: "Notes",
                                                      image: .addImage!, delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()

    }
    override func viewWillAppear(_ animated: Bool) {
        notes.removeAll()
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
    func addNoteButton() {
        
        let addButton = UIButton(type: .system)
        addButton.setImage(.addImage, for: .normal)
        addButton.tintColor = .white
        addButton.backgroundColor = .greenColor
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 36/2
        addButton.anchor(top: view.topAnchor,
                         right: view.rightAnchor,
                          paddingTop: 66,
                          paddingRight: 20,
                          width: 36,
                          height: 36)
        addButton.addTarget(self, action: #selector(handleAddButtonSelected),
                            for: .touchUpInside)
        
    }
    private func fetchData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
       
        do {
            let sort = NSSortDescriptor(key: #keyPath(Goals.time), ascending: true)
            fetchRequest.sortDescriptors = [sort]
            
            let fetchResult = try manageContext.fetch(fetchRequest)
           
            for data in fetchResult as! [NSManagedObject] {
                
                self.notes.append(data)
     
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

extension NoteCollectionController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.identifier, for: indexPath) as! HomeCollectionCell
        cell.data = notes[indexPath.item]
        cell.index = indexPath.row
        cell.delegate = self
        guard let text = notes[indexPath.item].value(forKey: "note") as? String else {return cell}
        cell.contentLabel.text =  text
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = EachNoteControlelr()
        vc.data = notes[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension NoteCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
        return CGSize(width: view.frame.width, height: 150)
    }

}
extension NoteCollectionController: CustomNavigationViewDelegate {
   
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        let vc = AddNewNoteController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

}
    // MARK: - HomeCollecionCellDelegate
extension NoteCollectionController: HomeCollecionCellDelegate {
    func homeCollectionCell(_ cell: HomeCollectionCell, data: NSManagedObject, index: Int) {
        
        let itemData = data
        
        self.notes.remove(at: index)
        
        Service.deleteCoreDataContent(index: index, itemData: itemData,
                                      collectionView: self.collectionView)
        
        collectionView.reloadData()
        

    }
    
    
}


