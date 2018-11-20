//
//  RoundedButton.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/17.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    var isActive = false
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1/UIScreen.main.nativeScale
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        layer.cornerRadius = 4
    }
}
