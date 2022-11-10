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
    private let mainToSetupIdentifier = "MainToSetup"
    private let mainToResultsIdentifier = "mainToResults"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.resultButtonTapHandler = { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.mainToResultsIdentifier, sender: nil)
        }
        mainView.settingButtonTapHandler = { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.mainToSetupIdentifier, sender: nil)
        }
        mainView.setupName(name ?? "")
        mainView.buttonTapHandler = { [weak self] buttonIndex in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.mainToQuestionsIdentifier, sender: buttonIndex)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == mainToQuestionsIdentifier, let sender = sender as? Int {
            let questionsVC = segue.destination as? QuestionsViewController
             questionsVC?.pollIndex = sender
             questionsVC?.name = self.name
        } else if segue.identifier == mainToSetupIdentifier {
        }
    
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {}
}
