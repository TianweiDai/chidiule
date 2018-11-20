//
//  RecommendationCollectionViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/23.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class RecommendationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 7
        
    }
    
}
