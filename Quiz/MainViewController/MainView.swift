//
//  MainView.swift
//  Quiz
//
//  Created by Павел on 25.08.2022.
//

import UIKit

class MainView: UIView {
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    
    var buttonTapHandler: ((Int) -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
}

    @IBAction func buttonViewDidTap(_ sender: UIButton) {
        buttonTapHandler?(sender.tag)
    }
}
