//
//  DiscoverTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/7.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        coverImageView.layer.cornerRadius = 7.0
        coverImageView.clipsToBounds = true
        coverImageView.contentMode = .scaleAspectFill
    }
    func fill(article: Article){
        contentLabel.text = article.content
        titleLabel.text = article.title
        coverImageView.image = article.coverImage
    }

    
}
