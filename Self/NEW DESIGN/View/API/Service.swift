//
//  Service.swift
//  Self
//
//  Created by Thenny Chhorn on 4/14/22.
//

import UIKit
import CoreData

struct Service {
    
    static func setDateString() -> String {
        let date = Date()
        let day = date.dayoftheWeek()
        let time = DateFormatter()
        time.timeStyle = .short
        time.dateStyle = .medium
        let setDate = "\(day) " + time.string(from: date)
        return setDate
    }
    static func deleteCoreDataFromEachView(itemData data: NSManagedObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        manageContext.delete(data)
        do{
            try manageContext.save()
            print("DEBUG: DATA IS now saved")
        }catch{
            print("DEBUG: ERROR ")
        }
    }
    static func saveNewDataAndDeleteOldData(_ data: NSManagedObject, entity: String, contentName: String) {
        
    }
    static func pinnedQuote(_ quote: String, boolean: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let storage = NSEntityDescription.entity(forEntityName: "Quote", in: manageContext)
        let storageKey = NSManagedObject(entity: storage!, insertInto: manageContext)
        storageKey.setValue(quote, forKey: "quote")
        storageKey.setValue(boolean, forKey: "value")
        
        do {
            try manageContext.save()
        }catch {
            print("DEBUG: FAILED TO PIN QUOTE")
        }
    }
    static func unPinnedQuote(_ itemData: NSManagedObject) {
        
    }
    static func deleteCoreDataContent(index: Int, itemData: NSManagedObject,
                              collectionView: UICollectionView) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        manageContext.delete(itemData)
        
        let indexPath = IndexPath(row: index, section: 0)
      
        collectionView.performBatchUpdates {
            collectionView.deleteItems(at: [indexPath])
        } completion: { (true) in
            
            collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
            do{
                try manageContext.save()
                
            }catch{
                print("DEBUG: ERROR ")
            }
            
        }
    }
    static func handleSaveGoalData(contentName: String){
        
        let setDate = setDateString()
        let timeStamp = Date().timeIntervalSince1970 as Double
        let reverseTime = -1 * timeStamp
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let storage = NSEntityDescription.entity(forEntityName: "Goals", in: manageContext)
        let storageName = NSManagedObject(entity: storage! , insertInto: manageContext)
        storageName.setValue(setDate, forKey: "date")
        storageName.setValue(contentName,forKey: "goal")
        storageName.setValue(reverseTime, forKey: "time")
        
        do{
            try manageContext.save()
        }catch{
            print("Debug: failed to save goals")
        }
    }
    static func handleSaveNoteData(contentName: String){
        
        let setDate = setDateString()
        let timeStamp = Date().timeIntervalSince1970 as Double
        let reverseTime = -1 * timeStamp
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let storage = NSEntityDescription.entity(forEntityName: "Notes", in: manageContext)
        let storageName = NSManagedObject(entity: storage! , insertInto: manageContext)
        storageName.setValue(setDate, forKey: "date")
        storageName.setValue(contentName,forKey: "note")
        storageName.setValue(reverseTime, forKey: "time")
        
        do{
            try manageContext.save()
        }catch{
            print("Debug: failed to save Notes")
        }
    }
    static func handleSaveDiaryData(contentName: String){
        
        let setDate = setDateString()
        let timeStamp = Date().timeIntervalSince1970 as Double
        let reverseTime = -1 * timeStamp
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let storage = NSEntityDescription.entity(forEntityName: "Diary", in: manageContext)
        let storageName = NSManagedObject(entity: storage! , insertInto: manageContext)
        storageName.setValue(setDate, forKey: "date")
        storageName.setValue(contentName,forKey: "diary")
        storageName.setValue(reverseTime, forKey: "time")
        
        do{
            try manageContext.save()
        }catch{
            print("Debug: failed to save Diary")
        }
    }
    static func handleSaveReflectionData(answersString: [String], text: String) {

        let setDate = setDateString()
        
        let timeStamp = Date().timeIntervalSince1970 as Double
        let reverseTime = -1 * timeStamp
        
        guard let appDelegate =  UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let storage = NSEntityDescription.entity(forEntityName: "Reflection", in: manageContext)
        let storageName = NSManagedObject(entity: storage!, insertInto: manageContext)
        
        storageName.setValue(setDate, forKey: "date")
        storageName.setValue(answersString[0], forKey: "day")
        storageName.setValue(answersString[1], forKey: "laugh")
        storageName.setValue(answersString[2], forKey: "grateful")
        storageName.setValue(answersString[3], forKey: "satify")
        storageName.setValue(text,forKey: "reflectText")
        storageName.setValue(reverseTime, forKey: "time")
        
        do {
            
            try manageContext.save()
            
     
        }catch {
            print("Debug: Failed to save reflection")
        }
    }
    static func fetchData(entity: String, storage: String, completion: @escaping(NSManagedObject) -> Void) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        do{
            let fetchResult = try manageContext.fetch(fetchRequest)
            guard let data = fetchResult[0] as? NSManagedObject else {return}
            //let data = dataText
            print("DEBUGING: ****** \(data)")
            completion(data)
            
        }catch{
            print("DEBUG: FAILED TO FETCH DATA FROM ")
        }
        
    }
    static func saveQuote(_ quote: QuoteModel) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let storage = NSEntityDescription.entity(forEntityName: "Quote", in: manageContext)
        let storageName = NSManagedObject(entity: storage! , insertInto: manageContext)
        
        let savedQuote = quote.quote
        let savedAuthor = quote.author
        
        print("DEBUG: =====> ****** \(savedQuote)  \(savedAuthor)")
        
        storageName.setValue(savedQuote, forKey: "quote")
        storageName.setValue(savedAuthor,forKey: "author")
       
        do {

            try manageContext.save()
            print("DEBUG: SAVED PINNED QUOTE *******")
        }catch {
            print("DEBUG: FAILED TO ")
        }
    }
    static func unSaveQuote() {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Quote")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try! manageContext.execute(deleteRequest)
            print(" DEBUG: ***** =====> REMOVING QUOTE ")
        }
        
    }
    static func fetchSavedQuote(completion: @escaping(QuoteModel) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manager = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
       
        do{
            let result = try manager.fetch(fetchRequest)
       
            for data in result as! [NSManagedObject] {
                
                let savedQuote = data.value(forKey: "quote") as? String ?? ""
                let savedAuthor = data.value(forKey: "author") as? String ?? ""
                
                let quote = QuoteModel(quote: savedQuote, author: savedAuthor)
                completion(quote)
            }
        }catch{
            print("FAILED TO FETCH SAVED QUOTE")
        }
    }
 
}



