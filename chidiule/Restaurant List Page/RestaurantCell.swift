//
//  RestaurantCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/12.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import SDWebImage

class RestaurantCell: UITableViewCell {
    
    
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var referrerLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
//        layer.sublayers?.removeAll()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        coverImageView.layer.cornerRadius = 7.0
        self.selectionStyle = .none
    }

    func fill(with restaurant: Restaurant){
        titleLabel.text = restaurant.title
        addressLabel.text = restaurant.address
        if let photo_url = URL(string: restaurant.photo_url){
            coverImageView.sd_setImage(with: photo_url, placeholderImage: UIImage(named: "gray_background_image"))
            
        }

        starImageView.image = restaurant.star
        reviewsLabel.text = restaurant.review
        referrerLabel.text = restaurant.referrer
        categoryLabel.text = restaurant.category
        openLabel.text = restaurant.open
        if(restaurant.open == "营业中") {
            openLabel.textColor = UIColor.openGreen()
        }
        
        distanceLabel.text = restaurant.distance
        priceLabel.text = restaurant.price
        
    }
    
}


