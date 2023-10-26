//
//  TableViewCell.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 18/10/23.
//

import UIKit

final class JokeCell: UITableViewCell {
    
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel.numberOfLines = 0
        punchlineLabel.numberOfLines = 0

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.layer.cornerRadius = 20
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 0.3
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 15
        contentView.layer.shadowOpacity = 0.5
    }
}
