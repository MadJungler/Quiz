//
//  ProgressView.swift
//  Quiz
//
//  Created by Павел on 19.08.2022.
//

import UIKit

class ProgressView: UIView {
    
    @IBOutlet weak var clockImageView: UIImageView!
    @IBOutlet weak var timerProgressView: UIView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var widthTimerProgressViewConstraints: NSLayoutConstraint!
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(xibView)
        widthTimerProgressViewConstraints.constant = 100
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.borderWidth = 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
        layer.cornerRadius = frame.height / 2
        timerProgressView.layer.cornerRadius = (frame.height - Constans.inset * 2) / 2
    }
    
    func configure(remainingTime: Int, allTheTime seconds: Int, animated: Bool) {
        labelView.text = "\(remainingTime / 10) sec"
        
        widthTimerProgressViewConstraints.constant = (bounds.width - Constans.inset * 3 - clockImageView.frame.width) / CGFloat(seconds) * CGFloat(remainingTime)
        if animated {
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
                self.layoutIfNeeded()
            }
        } else {
            UIView.performWithoutAnimation {
                self.layoutIfNeeded()
            }
        }
    }
    
    private enum Constans {
        static let inset: CGFloat = 2
    }
}
