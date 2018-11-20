//
//  WriteCommentViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/27.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class WriteCommentViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.white
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
    }
    

    
}
