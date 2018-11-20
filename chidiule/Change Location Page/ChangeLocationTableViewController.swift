//
//  ChangeLocationTableViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/1.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class ChangeLocationTableViewController: UITableViewController {
    
    
    struct Storyboard {
        static let currentCityCell = "CurrentCityCell"
        static let hotCitiesCell = "HotCitiesCell"
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1 -- current city cell
        // 2 -- hot cities
        
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.currentCityCell, for: indexPath)
            cell.selectionStyle = .none
            
            cell.separatorInset.right = 15
//            cell.layoutMargins = UIEdgeInsets.zero
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.hotCitiesCell, for: indexPath)
            cell.selectionStyle = .none
            
            return cell
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }


    

}
