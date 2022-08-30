//
//  LoginViewController.swift
//  Quiz
//
//  Created by Павел on 18.08.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginToMainIdentifier = "loginToMain"
    
    @IBOutlet var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.buttonTapHandler = {
            self.performSegue(withIdentifier: self.loginToMainIdentifier, sender: nil)
        }
    }
}
