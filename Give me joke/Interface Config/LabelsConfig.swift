//
//  JokeLabelConfig.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 24/7/23.
//

import UIKit

struct JokeSetupLabelConfig {
    
    static func setupLabel(_ jokeLabel: UILabel, relativeTo referenceLabel: UILabel, onView view: UIView) {
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jokeLabel)
        
        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.bottomAnchor.constraint(equalTo: referenceLabel.topAnchor, constant: -10),
            jokeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        jokeLabel.font = UIFont(name: "SourceCodePro-Italic", size: 18)
        jokeLabel.numberOfLines = 0
        jokeLabel.textAlignment = .center
    }
    
}

struct JokePunchLabelConfig {
    
    static func setupLabel(_ jokeLabel: UILabel, onView view: UIView) {
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(jokeLabel)
        
        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            jokeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        jokeLabel.font = UIFont(name: "SourceCodePro-SemiBoldItalic", size: 20)
        jokeLabel.numberOfLines = 0
        jokeLabel.textAlignment = .center
    }
    
}


