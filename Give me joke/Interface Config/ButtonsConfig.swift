//
//  ButtonsConfig.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 25/7/23.
//

import UIKit

struct LikeButtonConfig {
    
    static func setupButton(_ likeButton: UIButton, relativeTo punchline: UILabel, onView view: UIView) {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: punchline.bottomAnchor, constant: +50),
            likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +50),
            likeButton.widthAnchor.constraint(equalToConstant: 100),
            likeButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        likeButton.contentMode = .scaleAspectFit
        
        likeButton.setImage(UIImage(named: "like"), for: .normal)
    }
    
}

struct DislikeButtonConfig {
    
    static func setupButton(_ dislikeButton: UIButton, relativeTo likeButton: UIButton, onView view: UIView) {
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dislikeButton)
        
        NSLayoutConstraint.activate([
            dislikeButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
//            dislikeButton.topAnchor.constraint(equalTo: punchline.bottomAnchor, constant: +50),
            dislikeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            dislikeButton.widthAnchor.constraint(equalToConstant: 100),
            dislikeButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        dislikeButton.contentMode = .scaleAspectFit
        
        dislikeButton.setImage(UIImage(named: "dislike"), for: .normal)
        
    }
    
}

struct LikedJokesButtonConfig {
    
    static func setupButton(_ likedJokesButton: UIButton, relativeTo likeButton: UIButton, onView view: UIView) {
        likedJokesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(likedJokesButton)
        
        NSLayoutConstraint.activate([
            likedJokesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likedJokesButton.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: +150),
            likedJokesButton.widthAnchor.constraint(equalToConstant: 150),
            likedJokesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        likedJokesButton.setTitle("Good Jokes", for: .normal)
        likedJokesButton.setTitleColor(.black, for: .normal)
        likedJokesButton.backgroundColor = .systemYellow
        likedJokesButton.layer.cornerRadius = 10
        likedJokesButton.clipsToBounds = true
    }
    
}
