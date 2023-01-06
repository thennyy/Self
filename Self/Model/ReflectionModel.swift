//
//  ReflectionModel.swift
//  Self
//
//  Created by Thenny Chhorn on 9/21/22.
//

import Foundation
import CoreData


struct ReflectionModel {
    
    
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    
    let reflectionText: String
    var section: QuestionSection?
    
    init(textData: NSManagedObject) {
        answer1 =  textData.value(forKey: "day") as? String ?? ""
        answer2 = textData.value(forKey: "laugh") as? String ?? ""
        answer3 = textData.value(forKey: "grateful") as? String ?? ""
        answer4 = textData.value(forKey: "satify") as? String ?? ""
        reflectionText = textData.value(forKey: "reflectText") as? String ?? ""
    }
}
