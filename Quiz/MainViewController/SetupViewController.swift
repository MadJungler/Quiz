//
//  SetupViewController.swift
//  Quiz
//
//  Created by Павел on 27.10.2022.
//

import UIKit

class SetupViewController: UIViewController {
    
    private let setupToMainIdentifier = "exitSettingsSegue"
    
    @IBOutlet var setupView: SetupView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView.shuffleSwitch.setOn(Setting.shared.isRandomOrder, animated: false)
        setupView.mainButtonTapHandler = { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: self.setupToMainIdentifier, sender: nil)
        }
        
        setupView.shuffleSwitchHandler = { switchIsOn in
            Setting.shared.setOrder(isRandom: switchIsOn)
        }
    }
}
