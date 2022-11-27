

import UIKit

class QuestionsView: UIView {
    
    private lazy var xibView: UIView = getViewFromXib() ?? UIView()
    
    var answerButtonTapHandler: ((String) -> Void)?
    
    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var questionBlockView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionCollectionView: UICollectionView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(xibView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        xibView.frame = self.bounds
    }
    
    func setup(model: QuestionsModel) {
        questionLabel.text = model.title
        questionCollectionView.reloadData()
    }
    
}
