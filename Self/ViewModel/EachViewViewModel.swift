//
//  EachViewModelView.swift
//  Self
//
//  Created by Thenny Chhorn on 9/27/22.
//

import UIKit
import CoreData

enum EachType: CaseIterable {
    case goal
    case reflect
    case note
    case diary
}

struct EachViewViewModel {

    var data: TextData?
    let rawData: NSManagedObject
    var value: String?
    var date: String?
    
    init(rawData: NSManagedObject, type: EachType) {
     
        self.rawData = rawData
        
        date = rawData.value(forKey: "date") as? String ?? ""
        
        switch type {
        case .goal:
            value = rawData.value(forKey: "goal") as? String ?? ""
        case .reflect:
            value = rawData.value(forKey: "reflectText") as? String ?? ""
        case .note:
            value = rawData.value(forKey: "note") as? String ?? ""
        case .diary:
            value = rawData.value(forKey: "diary") as? String ?? ""
        }
        
    }
}
