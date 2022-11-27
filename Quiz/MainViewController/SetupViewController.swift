

import UIKit

class SetupViewController: UIViewController {
    

    
    @IBOutlet var setupView: SetupView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView.shuffleSwitch.setOn(Setting.shared.isRandomOrder, animated: false)
        setupView.shuffleSwitchHandler = { switchIsOn in
            Setting.shared.setOrder(isRandom: switchIsOn)
        }
    }
}
