//
//  ProgressView.swift
//  Quiz
//
//  Created by Павел on 19.08.2022.
//

import UIKit

class ProgressView: UIView {
    
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
}
