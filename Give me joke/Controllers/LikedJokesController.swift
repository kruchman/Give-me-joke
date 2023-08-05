//
//  TableViewController.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 26/7/23.
//

import UIKit
import CoreData

class LikedJokesController: UITableViewController {

    let dataManager = CoreDataManager()
    var likedJokes: [SavedJokes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        tableView.register(LikedJokeCell.self, forCellReuseIdentifier: "LikedJokeCell")
        
        likedJokes = dataManager.loadLikedJokes()
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return likedJokes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedJokeCell", for: indexPath) as! LikedJokeCell
        if indexPath.row < likedJokes.count {
            cell.configure(setup: likedJokes[indexPath.row].setup ?? "", punchline: likedJokes[indexPath.row].punchline ?? "")
        }

                return cell
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.dataManager.context.delete(self.likedJokes[indexPath.row])
            self.likedJokes.remove(at: indexPath.row)
            
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

