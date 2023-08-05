//
//  LikedJokeCell.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 29/7/23.
//

import UIKit


class LikedJokeCell: UITableViewCell {

    private let setupLabel = UILabel()
    private  let punchlineLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .orange
        
        setupLabel.font = UIFont.systemFont(ofSize: 15)
        setupLabel.textColor = .black

        punchlineLabel.font = UIFont.boldSystemFont(ofSize: 15)
        punchlineLabel.textColor = .black   

        contentView.addSubview(setupLabel)
        contentView.addSubview(punchlineLabel)

        setupLabel.translatesAutoresizingMaskIntoConstraints = false
        punchlineLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            setupLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            setupLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            setupLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            punchlineLabel.topAnchor.constraint(equalTo: setupLabel.bottomAnchor, constant: 4),
            punchlineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            punchlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            punchlineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    func configure(setup: String, punchline: String) {
        setupLabel.text = "setup: " + setup
        punchlineLabel.text = "punchline: " + punchline
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
