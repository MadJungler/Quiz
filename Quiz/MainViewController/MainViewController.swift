//
//  MainViewController.swift
//  Quiz
//
//  Created by Павел on 18.08.2022.
//

import UIKit

class MainViewController: UIViewController {

    var name: String?
    private let mainToQuestionsIdentifier = "mainToQuestions"
    @IBOutlet var mainView: MainView!
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.pollNameTableView.delegate = self
        mainView.pollNameTableView.dataSource = self
        
       
        mainView.setupName(name ?? "")
        mainView.pollNameTableView.register(
            UINib(nibName: "PollTitleTableViewCell", bundle: .main),
            forCellReuseIdentifier: cellIdentifier
        )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == mainToQuestionsIdentifier, let sender = sender as? Int {
            let questionsVC = segue.destination as? QuestionsViewController
             questionsVC?.pollIndex = sender
             questionsVC?.name = self.name
        }
    
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {}
}
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: mainToQuestionsIdentifier, sender: indexPath.item)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PollStorage.polls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PollTitleTableViewCell
            else { return UITableViewCell() }
        cell.configure(text: PollStorage.polls[indexPath.item].name)

        return cell
    }
    
    
}
