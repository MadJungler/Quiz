//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Павел on 18.08.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var questionsView: QuestionsView!
    
    private let questionsToMainIdentifier = "questionsToMain"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionsView.buttonTapHandler = {
            self.performSegue(withIdentifier: self.questionsToMainIdentifier, sender: nil)
        }
    }
}
