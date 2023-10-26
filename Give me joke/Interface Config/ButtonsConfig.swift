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
        
        likeButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        likeButton.layer.shadowColor = UIColor.black.cgColor
        likeButton.layer.shadowOpacity = 0.5
        likeButton.layer.shadowRadius = 5
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
        
        dislikeButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        dislikeButton.layer.shadowColor = UIColor.black.cgColor
        dislikeButton.layer.shadowOpacity = 0.5
        dislikeButton.layer.shadowRadius = 5
    }
    
}

struct GoodJokesButtonConfig {
    
    static func setupButton(_ goodJokesButton: UIButton, relativeTo likeButton: UIButton, onView view: UIView) {
        goodJokesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goodJokesButton)
        
        NSLayoutConstraint.activate([
            goodJokesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goodJokesButton.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: +150),
            goodJokesButton.widthAnchor.constraint(equalToConstant: 250),
            goodJokesButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        
        goodJokesButton.setTitle("Good Jokes    🔥🔥🔥", for: .normal)
        goodJokesButton.setTitleColor(.black, for: .normal)
        goodJokesButton.backgroundColor = UIColor(named: "buttonColor") ?? UIColor.systemYellow
        goodJokesButton.layer.cornerRadius = 10
        goodJokesButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        goodJokesButton.layer.shadowColor = UIColor.black.cgColor
        goodJokesButton.layer.shadowOpacity = 0.5
        goodJokesButton.layer.shadowRadius = 5
        
        
    }
    
}
