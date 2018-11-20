//
//  MyCollectionTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/6.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class MyCollectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        coverImageView.layer.cornerRadius = 7.0
        coverImageView.clipsToBounds = true
        selectionStyle = .none
        bookmarkButton.setImage(UIImage(named: "icons8-bookmark-filled-50")?.withRenderingMode(.alwaysTemplate), for: .normal)
        bookmarkButton.tintColor = UIColor.red
        
    }
    
    @IBAction func cancelBookmark(_ sender: Any) {
        print("try to cancel bookmark")
    }
    func fill(restaurant: Restaurant){
        restaurantNameLabel.text = restaurant.title
        if let photo_url = URL(string: restaurant.photo_url){
            coverImageView.sd_setImage(with: photo_url, placeholderImage: UIImage(named: "gray_background_image"))
            
        }
        starImageView.image = restaurant.star
        addressLabel.text = restaurant.address
        reviewsLabel.text = restaurant.review
        categoryLabel.text = restaurant.category
    }
    

}
