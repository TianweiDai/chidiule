//
//  PersonalProfileTableViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/1.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class PersonalProfileTableViewController: UITableViewController {

    
    struct Storyboard {
        static let personalInfoCell = "PersonalInfoCell"
        static let menuItemCell1 = "MenuItemCell1"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
                
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1 -- personal info cell
        // 2 -- about us
        
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.personalInfoCell, for: indexPath) as! PersonalInfoTableViewCell
            cell.selectionStyle = .none
            
            cell.separatorInset.right = 0
            cell.separatorInset.left = 0
            
            cell.loginButtonView.isUserInteractionEnabled = true
            cell.loginButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showLoginVC)))
            //            cell.layoutMargins = UIEdgeInsets.zero
            
            return cell
        } else {

            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            if indexPath.row == 1 {
                cell.textLabel?.text = "编辑姓名"
            }
            else if indexPath.row == 2 {
                cell.textLabel?.text = "我的收藏"
            }
            else if indexPath.row == 3 {
                cell.textLabel?.text = "我的点评"
            }
            else if indexPath.row == 4 {
                cell.textLabel?.text = "关于我们"
            }
            
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    @objc func showLoginVC(){
        let dstVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        self.navigationController?.pushViewController(dstVC, animated: true)
        
    }
    

}
