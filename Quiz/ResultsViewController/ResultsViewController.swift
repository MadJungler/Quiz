//
//  ResultsViewController.swift
//  Quiz
//
//  Created by Павел on 06.11.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    let resultCellIdentifier = "ResultsTableViewCell"
    private let resultsToMainIdentifier = "resultsToMain"
    @IBOutlet weak var resultsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        
        resultsTableView.register(UINib(nibName: "ResultsTableViewCell", bundle: nil), forCellReuseIdentifier: resultCellIdentifier)
    }
}

extension ResultsViewController: UITableViewDelegate {
    
}

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Setting.shared.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: resultCellIdentifier, for: indexPath) as? ResultsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(model: Setting.shared.results[indexPath.item])
        return cell
    }
}
