//
//  CommentTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/26.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var profileImage: RoundedImage!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
