//
//  PhotoCollectionViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/25.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    func fill(with photoUrl: String){
        if let photo_url = URL(string: photoUrl){
            imageView.sd_setImage(with: photo_url, placeholderImage: UIImage(named: "gray_background_image"))
        }

    }
}
