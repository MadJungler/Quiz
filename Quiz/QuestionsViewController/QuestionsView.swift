//
//  QuestionsView.swift
//  Quiz
//
//  Created by Павел on 25.08.2022.
//

import UIKit

class QuestionsView: UIView {
    
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    
    var buttonTapHandler: (() -> Void)?
    
    @IBOutlet weak var progressView: ProgressView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
    
    @IBAction func buttonViewDidTap(_ sender: UIButton) {
        buttonTapHandler?()
    }
}
