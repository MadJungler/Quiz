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
        
        mainView.buttonTapHandler = {
            self.performSegue(withIdentifier: self.mainToQuestionsIdentifier, sender: nil)
        }
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {}
}
