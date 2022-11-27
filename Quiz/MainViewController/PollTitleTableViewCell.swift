//
//  PollTitleTableViewCell.swift
//  Quiz
//
//  Created by Павел on 15.11.2022.
//

import UIKit

class PollTitleTableViewCell: UITableViewCell {
    @IBOutlet weak var pollTitleLabel: UILabel!
    @IBOutlet weak var pollTitleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pollTitleView.layer.cornerRadius = 10
        selectionStyle = .none
    }
    
    func configure(text: String) {
        pollTitleLabel.text = text
    }
}
