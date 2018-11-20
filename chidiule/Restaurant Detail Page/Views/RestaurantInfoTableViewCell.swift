//
//  RestaurantInfoTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/13.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class RestaurantInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var reviewNumLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categpryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var refererLabel: UILabel!
    @IBOutlet weak var reviewImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fill(with restaurant: Restaurant){
        starImageView.image = restaurant.star
        openLabel.text = restaurant.open
        priceLabel.text = restaurant.price
        categpryLabel.text = restaurant.category
        addressLabel.text = restaurant.address
        nameLabel.text = restaurant.title
        distanceLabel.text = restaurant.distance
        refererLabel.text = restaurant.referrer
        reviewNumLabel.text = restaurant.review
        if(restaurant.open == "营业中") {
            openLabel.textColor = UIColor.openGreen()
        }
    }

}
