//
//  RoundedImage.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/31.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3.0
        
    }
    

}
