//
//  MyCommentViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/19.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class MyCommentViewController: UIViewController, UITableViewDataSource{
    
    
    struct Comment {
        var comment: String
        var star: UIImage
        var restId: String
        var restaurantName: String
        
    }
    var comments: [Comment] = [
        
    ]
    
    @IBOutlet var commentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        commentTableView.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCommentTableViewCell
        
        
        
        return cell
    }

}
