//
//  ReflectionController.swift
//  Self
//
//  Created by Thenny Chhorn on 9/15/22.
//

import UIKit
import CoreData

protocol AddReflectionControllerDelegate: AnyObject {
    func addReflectionController(_ controller: AddReflectionController,
                                 answers: [String])
}

class AddReflectionController: UICollectionViewController {


    private var answer1 = ""
    private var answer2 = ""
    private var answer3 = ""
    private var answer4 = ""
    
    private var answerStrings = [String]()
    weak var delegate: AddReflectionControllerDelegate?
    
    private lazy var navigationView = CustomNavigationView(titleString: "Daily Mood Reflection",
                                                           image: .rightArrow,
                                                           delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureUI()
        
    }
    
    fileprivate func configureUI() {
        
        view.backgroundColor = .defaultColor
        view.addSubview(navigationView)
        
        navigationView.anchor(top: view.topAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              height: 120)
       
        collectionView.backgroundColor = .defaultColor
        collectionView.register(AddReflectionViewCell.self, forCellWithReuseIdentifier: AddReflectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0)
        
    }
    
   @objc private func checkAnswerSelected() {
       print("DEBUG ALL")
        guard answer1 != "", answer2 != "", answer3 != "", answer4 != "" else {return}
    
       print("DEBUG ALL SEGMENT SELECTED")
        navigationView.enableAddButton()
        
    }
    
    
}

extension AddReflectionController {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        
        return QuestionSection.allCases.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddReflectionViewCell.identifier, for: indexPath) as! AddReflectionViewCell
        
        guard let anwerSection = AnswerSection(rawValue: indexPath.row) else {return UICollectionViewCell() }
        
        guard let questionSection = QuestionSection(rawValue: indexPath.row) else {return UICollectionViewCell() }
        cell.index = indexPath.row
        cell.viewModel = AddReflectionViewModel(answers: anwerSection, questions: questionSection)
        cell.delegate = self
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
// MARK: - UICollectionViewDelegateFlowLayout

extension AddReflectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 111)
        
    }
}
// MARK: - CustomNavigationViewDelegate

extension AddReflectionController: CustomNavigationViewDelegate {
  
    func customNavigationView(_ view: CustomNavigationView, addButton: UIButton) {
        let vc = WriteReflectionController()

        vc.delegate = self 
        vc.answerStrings = answerStrings
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    func customNavigationView(_ view: CustomNavigationView, backButton: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
// MARK: - AddReflectionViewCellDelegate

extension AddReflectionController: AddReflectionViewCellDelegate {
   
    func addReflecitonViewCell(_ cell: AddReflectionViewCell, segmentControl: UISegmentedControl, segmentValue: String, index: Int, questions: QuestionSection) {
 
        print("DEBUG  SELECTED")
        switch questions {
        case .question1:
            answer1 = segmentValue
        case .question2:
            answer2 = segmentValue
        case .question3:
            answer3 = segmentValue
        case .question4:
            answer4 = segmentValue
        }
        print("DEBUG  ANSWERS ", answer1, answer2, answer3, answer4)
        guard answer1 != "", answer2 != "", answer3 != "", answer4 != "" else {return}
        answerStrings = [answer1, answer2, answer3, answer4]
        
        navigationView.enableAddButton()
        
        
    }

    func configureAnswers(answers: [String]) {
        print("DEBUG: CONFIGURE ANSWER ")
        
       // delegate?.addReflectionController(self, answers: answers)
    }
    
}
extension AddReflectionController: WriteReflectionControllerDelegate {
    func writeReflectionController(_ controller: WriteReflectionController) {
        controller.dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    
}

