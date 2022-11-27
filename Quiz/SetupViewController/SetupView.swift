

import UIKit

class SetupView: UIView {
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    var shuffleSwitchHandler: ((Bool) -> Void)?
    @IBOutlet weak var shuffleSwitch: UISwitch!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    
    @IBAction func shuffleDidTap(_ sender: UISwitch) {
        shuffleSwitchHandler?(sender.isOn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
}
