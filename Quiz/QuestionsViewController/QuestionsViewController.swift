//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Павел on 18.08.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    var pollIndex: Int?
    var questionIndex = 0
    @IBOutlet var questionsView: QuestionsView!
    
    private let questionsToMainIdentifier = "questionsToMain"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pollIndex = pollIndex else {
            return
        }
        
        let pollstorage = PollStorage()
        let firstPoll = pollstorage.polls[pollIndex]
        
        func alertLoad(title: String) {
            let alert = UIAlertController(title: "Attention!", message: title, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .destructive) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
        
        func questionLoad() {
            let firstQuestions = firstPoll.questions[questionIndex]
            let model = QuestionsModel(title: firstQuestions.title, variants: firstQuestions.variants)
            questionsView.setup(model: model)
        }
        
        questionLoad()
        
        questionsView.answerButtonTapHandler = { variant in
            if variant == firstPoll.questions[self.questionIndex].answer {
                self.questionIndex += 1
                if self.questionIndex >= firstPoll.questions.count {
                   alertLoad(title: "You win! :)")
                    return
                }
                
               questionLoad()
                
            } else {
               alertLoad(title: "You lose :(")
            }
        }
        
        questionsView.buttonTapHandler = {
            self.performSegue(withIdentifier: self.questionsToMainIdentifier, sender: nil)
        }
    }
}
