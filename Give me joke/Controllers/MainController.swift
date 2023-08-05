//
//  ViewController.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 24/7/23.
//

import UIKit
import CoreData

class MainController: UIViewController {
    
    let dataManager = CoreDataManager()
    
    var APIRequestmanager = APIRequestManager()
    
    let jokePunchLabel = UILabel()
    let jokeSetupLabel = UILabel()
    
    let likeButton = UIButton()
    let dislikeButton = UIButton()
    
    let likedJokes = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        JokePunchLabelConfig.setupLabel(jokePunchLabel, onView: view)
        JokeSetupLabelConfig.setupLabel(jokeSetupLabel, relativeTo: jokePunchLabel, onView: view)
        
        LikeButtonConfig.setupButton(likeButton, relativeTo: jokePunchLabel, onView: view)
        DislikeButtonConfig.setupButton(dislikeButton, relativeTo: likeButton, onView: view)
        
        LikedJokesButtonConfig.setupButton(likedJokes, relativeTo: likeButton, onView: view)
        
        APIRequestmanager.fetchJoke(jokePunchLabel: jokePunchLabel, jokeSetupLabel: jokeSetupLabel)
        
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(dislikeButtonPressed), for: .touchUpInside)
        likedJokes.addTarget(self, action: #selector(likedJokesButtonPressed), for: .touchUpInside)
        
    }
    
    @IBAction func dislikeButtonPressed() {
        
        APIRequestmanager.fetchJoke(jokePunchLabel: jokePunchLabel, jokeSetupLabel: jokeSetupLabel)
        
    }
    
    @IBAction func likeButtonPressed() {
        
        dataManager.saveJoke(setup: jokeSetupLabel.text ?? "", punchline: jokePunchLabel.text ?? "")
        APIRequestmanager.fetchJoke(jokePunchLabel: jokePunchLabel, jokeSetupLabel: jokeSetupLabel)
        
    }
    
    @IBAction func likedJokesButtonPressed() {
        
        let likedJokesController = LikedJokesController()
            navigationController?.pushViewController(likedJokesController, animated: true)
    }
    
}
