//
//  AnswerModel.swift
//  Self
//
//  Created by Thenny Chhorn on 9/30/22.
//

import UIKit

struct Answers {
    
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    
    init(dictionary: [String:Any]) {
        self.answer1 = dictionary["answer1"] as? String ?? ""
        self.answer2 = dictionary["answer2"] as? String ?? ""
        self.answer3 = dictionary["answer3"] as? String ?? ""
        self.answer4 = dictionary["answer4"] as? String ?? ""
    }
}
