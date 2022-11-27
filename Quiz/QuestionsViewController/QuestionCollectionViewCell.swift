//
//  QuestionCollectionViewCell.swift
//  Quiz
//
//  Created by Павел on 15.11.2022.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var questionView: UIView!
    override var isSelected: Bool {
        didSet {
            if isSelected {
                questionView.layer.borderColor = UIColor.red.cgColor
                questionView.layer.borderWidth = 4
            } else {
                questionView.layer.borderColor = UIColor.white.cgColor
                questionView.layer.borderWidth = 0
            }
        }
    }
    @IBOutlet weak var questionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        questionView.layer.cornerRadius = 10
    }
    
    func configure(text: String) {
        questionLabel.text = text
    }
}
