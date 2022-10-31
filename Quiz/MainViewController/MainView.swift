//
//  MainView.swift
//  Quiz
//
//  Created by Павел on 25.08.2022.
//

import UIKit

class MainView: UIView {
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    @IBOutlet var nameLabel: UILabel!
    var buttonTapHandler: ((Int) -> Void)?
    var settingButtonTapHandler: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    @IBAction func settingsButtonDidTap(_ sender: UIButton) {
        settingButtonTapHandler?()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
}
    func setupName(_ name: String) {
        nameLabel.text = name
    }
    @IBAction func buttonViewDidTap(_ sender: UIButton) {
        buttonTapHandler?(sender.tag)
    }
}
