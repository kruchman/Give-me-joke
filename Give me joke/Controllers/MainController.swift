//
//  ViewController.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 24/7/23.
//

import UIKit
import CoreData

final class MainController: UIViewController {
    
    private let dataManager = CoreDataManager()
    private var apiRequestmanager = APIRequestManager()
    
    private let jokeSetupLabel = UILabel()
    private let jokePunchLabel = UILabel()
    
    private let likeButton = UIButton()
    private let dislikeButton = UIButton()
    
    let goodJokesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Gradients.makeBackground(view: view)
        
        JokePunchLabelConfig.setupLabel(jokePunchLabel, onView: view)
        JokeSetupLabelConfig.setupLabel(jokeSetupLabel, relativeTo: jokePunchLabel, onView: view)
        
        LikeButtonConfig.setupButton(likeButton, relativeTo: jokePunchLabel, onView: view)
        DislikeButtonConfig.setupButton(dislikeButton, relativeTo: likeButton, onView: view)
        
        GoodJokesButtonConfig.setupButton(goodJokesButton, relativeTo: likeButton, onView: view)
        
        apiRequestmanager.fetchJoke { result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self.jokeSetupLabel.text = joke.setup
                    self.jokePunchLabel.text = joke.punchline
                }
            case .failure(_):
                return
            }
        }
        
        likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(dislikeButtonPressed), for: .touchUpInside)
        goodJokesButton.addTarget(self, action: #selector(likedJokesButtonPressed), for: .touchUpInside)
        
    }
    
    @IBAction func dislikeButtonPressed() {
        
        apiRequestmanager.fetchJoke { result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self.jokeSetupLabel.text = joke.setup
                    self.jokePunchLabel.text = joke.punchline
                }
            case .failure(_):
                return
            }
        }
        
    }
    
    @IBAction func likeButtonPressed() {
        
        dataManager.saveJoke(setup: jokeSetupLabel.text ?? "", punchline: jokePunchLabel.text ?? "")
        apiRequestmanager.fetchJoke { result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self.jokeSetupLabel.text = joke.setup
                    self.jokePunchLabel.text = joke.punchline
                }
            case .failure(_):
                return
            }
        }
        
    }
    
    @IBAction func likedJokesButtonPressed() {
        
        let likedJokesController = GoodJokesController()
            navigationController?.pushViewController(likedJokesController, animated: true)
    }
    
}
