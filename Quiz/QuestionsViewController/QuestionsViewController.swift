

import UIKit

class QuestionsViewController: UIViewController {
    private var time = 0
    private let maxTime = 600
    var pollIndex: Int?
    var name: String?
    var questionIndex = 0
    var timer: Timer?
    var pollTitle = ""
    let cellIdentifier = "cell"
    var firstPoll: PollModel!
    

    @IBOutlet var questionsView: QuestionsView!
        
    func alertLoad(title: String) {
        let alert = UIAlertController(title: "Attention!", message: title, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func saveCurrentGame() {
        guard let name = name else {
            return
        }

        let result = ResultModel(name: name, pollTitle: pollTitle, gameScore: questionIndex, date: Date())
        Setting.shared.newResult(result)
        print(Setting.shared.results)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        time = maxTime
        startTimer()
        guard let pollIndex = pollIndex else {
            return
        }
        questionsView.questionCollectionView.register(UINib(nibName: "QuestionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        questionsView.questionCollectionView.delegate = self
        questionsView.questionCollectionView.dataSource = self
        
        
        firstPoll = PollStorage.polls[pollIndex]
        pollTitle = firstPoll.name
        if Setting.shared.isRandomOrder {
            firstPoll.questions.shuffle()
        }
        
            
        
        questionLoad()
        
        
    }
    
   private func questionLoad() {
        time = maxTime
        let firstQuestions = firstPoll.questions[questionIndex]
        let model = QuestionsModel(title: firstQuestions.title, variants: firstQuestions.variants)
        questionsView.setup(model: model)
       
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self = self else {return}
            if self.time <= 0 {
                timer.invalidate()
                self.saveCurrentGame()
                self.alertLoad(title: "You lose!")
            }
            let isAnimated = self.time < self.maxTime
            self.questionsView.progressView.configure(remainingTime: self.time, allTheTime: self.maxTime, animated: isAnimated)
            self.time -= 1
        }
        timer?.fire()
    }
}

extension QuestionsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if firstPoll.questions[questionIndex].variants[indexPath.item] == firstPoll.questions[questionIndex].answer {
            
            self.questionIndex += 1
            if self.questionIndex >= firstPoll.questions.count {
                self.saveCurrentGame()
                self.alertLoad(title: "You win! :)")
                return
            }
            
           questionLoad()
            
        } else {
            self.saveCurrentGame()
            self.alertLoad(title: "You lose :(")
        }
                
    }
}

extension QuestionsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        firstPoll.questions[questionIndex].variants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? QuestionCollectionViewCell else {
             fatalError("Всему конец")
            
        }
        cell.configure(text: firstPoll.questions[questionIndex].variants[indexPath.item])
        return cell
    }
    
}
extension QuestionsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}
