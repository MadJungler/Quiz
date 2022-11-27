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
    @IBOutlet weak var pollNameTableView: UITableView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
        pollNameTableView.separatorStyle = .none
        pollNameTableView.isScrollEnabled = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
}
    func setupName(_ name: String) {
        nameLabel.text = name
    }
}
