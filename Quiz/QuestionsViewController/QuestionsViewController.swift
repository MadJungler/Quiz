//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Павел on 18.08.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    private var time = 0
    private let maxTime = 600
    var pollIndex: Int?
    var name: String?
    var questionIndex = 0
    var timer: Timer?
    var pollTitle = ""
    @IBOutlet var questionsView: QuestionsView!
    
    private let questionsToMainIdentifier = "questionsToMain"
    
    func alertLoad(title: String) {
        let alert = UIAlertController(title: "Attention!", message: title, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func saveCurrentGame() {
        guard let name = name else {
            return
        }

        let result = ResultModel(name: name, pollTitle: pollTitle, gameScore: questionIndex, date: Date())
        Setting.shared.newResult(result)
        print(Setting.shared.results)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = maxTime
        startTimer()
        guard let pollIndex = pollIndex else {
            return
        }
        
        let pollstorage = PollStorage()
        var firstPoll = pollstorage.polls[pollIndex]
        pollTitle = firstPoll.name
        if Setting.shared.isRandomOrder {
            firstPoll.questions.shuffle()
        }
        
        func questionLoad() {
            time = maxTime
            let firstQuestions = firstPoll.questions[questionIndex]
            let model = QuestionsModel(title: firstQuestions.title, variants: firstQuestions.variants)
            questionsView.setup(model: model)
        }
        
        questionLoad()
        
        questionsView.answerButtonTapHandler = { [weak self] variant in
            guard let self = self else {return}
            if variant == firstPoll.questions[self.questionIndex].answer {
                self.questionIndex += 1
                if self.questionIndex >= firstPoll.questions.count {
                    self.saveCurrentGame()
                    self.alertLoad(title: "You win! :)")
                    return
                }
                
               questionLoad()
                
            } else {
                self.saveCurrentGame()
                self.alertLoad(title: "You lose :(")
            }
        }
        
        questionsView.buttonTapHandler = { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.questionsToMainIdentifier, sender: nil)
        }
    }
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self = self else {return}
            self.time -= 1
            if self.time <= 0 {
                timer.invalidate()
                self.saveCurrentGame()
                self.alertLoad(title: "You lose!")
            }
            let isAnimated = self.time < self.maxTime
            self.questionsView.progressView.configure(remainingTime: self.time, allTheTime: self.maxTime, animated: isAnimated)
            self.time -= 1
        }
        timer?.fire()
    }
}
