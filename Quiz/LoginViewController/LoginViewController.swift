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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.nameTextField.text = "El Paco"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        loginView.buttonTapHandler = { [weak self] text in
            guard let self = self else { return }
            if text.count < 3 || text.count > 10 {
                self.showAlertTextName()
            } else {
                self.performSegue(withIdentifier: self.loginToMainIdentifier, sender: text)
            }
        }
    }
    
    deinit { NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        loginView.bottomFormConstraint.constant += keyboardRect.height
        UIView.animate(withDuration: CATransaction.animationDuration(), delay: 0) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        loginView.bottomFormConstraint.constant = 100
        UIView.animate(withDuration: CATransaction.animationDuration(), delay: 0) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == loginToMainIdentifier, let text = sender as? String else {
            return
        }
        let mainVC = segue.destination as? MainViewController
        mainVC?.name = text
    }
    
    func showAlertTextName() {
        let alertTextName = UIAlertController(title: "Attention!", message: "Your name is too short or too long", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)
        alertTextName.addAction(okAction)
        present(alertTextName, animated: true)
    }
}
