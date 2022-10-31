//
//  SetupView.swift
//  Quiz
//
//  Created by Павел on 27.10.2022.
//

import UIKit

class SetupView: UIView {
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    var mainButtonTapHandler: (() -> Void)?
    var shuffleSwitchHandler: ((Bool) -> Void)?
    @IBOutlet weak var shuffleSwitch: UISwitch!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    
    @IBAction func backButtonDidTap(_ sender: UIButton) {
        mainButtonTapHandler?()
    }
    
    @IBAction func shuffleDidTap(_ sender: UISwitch) {
        shuffleSwitchHandler?(sender.isOn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
}
