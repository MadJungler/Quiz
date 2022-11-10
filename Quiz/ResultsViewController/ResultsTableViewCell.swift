//
//  ResultsTableViewCell.swift
//  Quiz
//
//  Created by Павел on 06.11.2022.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    let currenDate = Date()
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var wrapperView: UIView!
    @IBOutlet weak var polltiTleLabel: UILabel!
    
    func configure(model: ResultModel) {
        nameLabel.text = model.name
        dateLabel.text = DateFormatter.defaultDateFormatter.string(from: currenDate)
        scoreLabel.text = "Счёт: \(model.gameScore)"
        polltiTleLabel.text = model.pollTitle
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
   
        wrapperView.layer.borderColor = UIColor.blue.cgColor

    }
}

