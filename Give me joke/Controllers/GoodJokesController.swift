//
//  TableViewController.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 26/7/23.
//

import UIKit
import CoreData

class GoodJokesController: UITableViewController {

    private let dataManager = CoreDataManager()
    private var goodJokes: [SavedJokes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Good Jokes 🔥🔥🔥"
        navigationController?.navigationBar.tintColor = .black

        tableView.delegate = self
        tableView.register(UINib(nibName: "JokeCell", bundle: nil), forCellReuseIdentifier: "JokeCell")
        
        goodJokes = dataManager.loadLikedJokes()
        tableView.reloadData()
        
    }

    // MARK: - Table view data source methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodJokes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as! JokeCell

        cell.setupLabel.text = goodJokes[indexPath.row].setup
        cell.punchlineLabel.text = goodJokes[indexPath.row].punchline
        
        return cell
        
    }

    
    // MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = 120
        return CGFloat(cellHeight)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.dataManager.context.delete(self.goodJokes[indexPath.row])
            self.goodJokes.remove(at: indexPath.row)
            
            self.dataManager.saveContext()
            tableView.reloadData()
            
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
        
    }
    
}

