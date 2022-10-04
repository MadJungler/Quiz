//
//  MainViewController.swift
//  Quiz
//
//  Created by Павел on 18.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let mainToQuestionsIdentifier = "mainToQuestions"
    
    @IBOutlet var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.buttonTapHandler = { buttonIndex in
            self.performSegue(withIdentifier: self.mainToQuestionsIdentifier, sender: buttonIndex)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == self.mainToQuestionsIdentifier, let sender = sender as? Int
        else { return }
       let questionsVC = segue.destination as? QuestionsViewController
        questionsVC?.pollIndex = sender
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {}
}
