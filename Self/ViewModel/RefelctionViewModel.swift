//
//  RefelctionViewModel.swift
//  Self
//
//  Created by Thenny Chhorn on 9/21/22.
//

import UIKit
import CoreData

enum QuestionSection: Int, CaseIterable {
   
    case question1
    case question2
    case question3
    case question4
    
    var question: String {
        switch self {
        case .question1:
            return "◎ How was your day?"
        case .question2:
            return "◎ Did you laugh Today?"
        case .question3:
            return "◎ Were you grateful today?"
        case .question4:
            return "◎ Were you satified with your day?"
        }
    }

}

struct ReflectionViewModel {
    
    var reflectionData: ReflectionModel
    var section: QuestionSection
    var question: String?
    var answer: String?
    var addReflectAnswerArray = [String]()
    var reflectionText: String {
        return reflectionData.reflectionText
    }
    
    init(reflection: ReflectionModel, section: QuestionSection) {
        self.reflectionData = reflection
        self.section = section
        
        switch section {
        case .question1:
            answer = reflection.answer1
            question = section.question
            addReflectAnswerArray = ["Bad", "Decent", "Ver Good"]
        case .question2:
            answer = reflection.answer2
            question = section.question
            addReflectAnswerArray = ["Yes, I did", "No, I didn't"]
        case .question3:
            answer = reflection.answer3
            question = section.question
            addReflectAnswerArray = ["Yes, I was", "No, I wasn't"]
        case .question4:
            answer = reflection.answer4
            question = section.question
            addReflectAnswerArray = ["Not at all", "Quite", "Very"]
        }
    }
    
}
