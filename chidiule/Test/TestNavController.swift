//
//  TestNavController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/12.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class TestNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
    }
    

    

}
