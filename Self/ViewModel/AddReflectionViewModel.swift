//
//  AddRefelctionViewModel.swift
//  Self
//
//  Created by Thenny Chhorn on 9/30/22.
//

import UIKit

enum AnswerSection: Int, CaseIterable {
   
    case answer1
    case answer2
    case answer3
    case answer4
    
    var answerDecription: [String] {
        switch self {
        case .answer1:
            return ["Bad", "Decent", "Very good"]
        case .answer2:
            return ["Yes, I did", "No, I didn't"]
        case .answer3:
            return ["Yes, I was", "No, I wasn't"]
        case .answer4:
            return ["Not at all", "Quite", "Very"]
        }
    }

}
struct AddReflectionViewModel {
    
    var answers: AnswerSection
    var questions: QuestionSection
    var answerString: [String]?
    var questionString: String?
    
    init(answers: AnswerSection, questions: QuestionSection) {
       
        self.answers = answers
        self.questions = questions
        
        switch questions {
        case .question1:
            questionString = questions.question
            answerString = answers.answerDecription
        case .question2:
            questionString = questions.question
            answerString = answers.answerDecription
        case .question3:
            questionString = questions.question
            answerString = answers.answerDecription
        case .question4:
            questionString = questions.question
            answerString = answers.answerDecription
        }

        
    }
}
