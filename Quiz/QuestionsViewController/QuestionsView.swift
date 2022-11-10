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
    var answerButtonTapHandler: ((String) -> Void)?
    
    @IBOutlet var questionButtons: [UIButton]!
    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var questionBlockView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
    
    @IBAction func answerButtonDidTap(_ sender: UIButton) {
        answerButtonTapHandler?(sender.title(for: []) ?? "")  // для любого состояния или вернуть ""
    }
    @IBAction func buttonViewDidTap(_ sender: UIButton) {
        buttonTapHandler?()
    }
    
    func setup(model: QuestionsModel) {
        questionLabel.text = model.title
        questionButtons.forEach { $0.isHidden = true }
        for (index, variant) in model.variants.enumerated() {
            questionButtons[index].setTitle(variant, for: [])
            questionButtons[index].isHidden = false
        }
//        questionButtonOne.setTitle(model.variants[0], for: [])
//        questionButtonTwo.setTitle(model.variants[1], for: [])
//        questionButtonThree.setTitle(model.variants[2], for: [])
//        questionButtonFour.setTitle(model.variants[3], for: [])
    }
    
}
