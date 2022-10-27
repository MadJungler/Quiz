//
//  MainViewController.swift
//  Quiz
//
//  Created by Павел on 18.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var name: String?
    
    private let mainToQuestionsIdentifier = "mainToQuestions"
    
    @IBOutlet var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setupName(name ?? "")
        mainView.buttonTapHandler = { buttonIndex in
            self.performSegue(withIdentifier: self.mainToQuestionsIdentifier, sender: buttonIndex)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == mainToQuestionsIdentifier, let sender = sender as? Int
        else { return }
       let questionsVC = segue.destination as? QuestionsViewController
        questionsVC?.pollIndex = sender
        questionsVC?.name = self.name
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {}
}
