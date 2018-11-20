//
//  AdViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/18.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {

    
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
        // Do any additional setup after loading the view.
    }
    

    
}
