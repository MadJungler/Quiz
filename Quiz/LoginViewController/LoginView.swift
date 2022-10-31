//
//  LoginView.swift
//  Quiz
//
//  Created by Павел on 25.08.2022.
//

import UIKit

class LoginView: UIView {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bottomFormConstraint: NSLayoutConstraint!
    
    
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    
    var buttonTapHandler: ((String) -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
    
    @IBAction func buttonViewDidTap(_ sender: UIButton) {
        guard let text = nameTextField.text else { return }
        buttonTapHandler?(text)
    }
}
