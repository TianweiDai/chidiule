//
//  RestaurantPhotoGalleryCollectionViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/31.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class RestaurantPhotoGalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var photoGalleryController: RestaurantPhotoGalleryCollectionViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        imageView.layer.cornerRadius = 7.0
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.gray
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleZoomOut)))
    }
    @objc func handleZoomOut(tapGesture: UIGestureRecognizer){
        
        if let imageView = tapGesture.view as? UIImageView{
            self.photoGalleryController?.performZoomInForStartingImageView(startingImageView: imageView)
        }
        
    }

    
    
}
