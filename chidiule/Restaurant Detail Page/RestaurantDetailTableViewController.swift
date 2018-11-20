//
//  RestaurantDetailTableViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/27.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import CoreLocation


class RestaurantDetailTableViewController: UITableViewController {
    
    
    var restaurant: Restaurant?
    struct Storyboard {
        static let showImagesPageVC = "ShowImagesPageViewController"
        static let restaurantInfoCell = "RestaurantInfoCell"
        static let photoCell = "PhotoCell"
        static let addressCell = "AddressCell"
        static let writeCommentCell = "WriteCommentCell"
        static let commentTableCell = "CommentTableCell"
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    private func setup(){
        let menuShareBtn = UIButton(type: .custom)
        menuShareBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuShareBtn.setImage(UIImage(named: "icons8-share-50")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuShareBtn.tintColor = UIColor.black
        
        let menuBookmarkBtn = UIButton(type: .custom)
        menuBookmarkBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        menuBookmarkBtn.setImage(UIImage(named: "icons8-star-50")?.withRenderingMode(.alwaysTemplate), for: .normal)
        menuShareBtn.tintColor = UIColor.black
        menuShareBtn.addTarget(self, action: #selector(share), for: .touchDown)
        
        
        let menuBarItem1 = UIBarButtonItem(customView: menuShareBtn)
        let menuBarItem2 = UIBarButtonItem(customView: menuBookmarkBtn)
        menuBarItem1.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        menuBarItem1.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        menuBarItem2.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        menuBarItem2.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.navigationItem.rightBarButtonItems = [menuBarItem1, menuBarItem2]
                
        
    }
    
    @objc func share(){
        print("try to share")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //1: RestaurantInfoCell
        //2: PhotoCell
        //3: AddressCell
        //4: WriteCommentCell
        //5: CommentTablecell
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.restaurantInfoCell, for: indexPath) as! RestaurantInfoTableViewCell
            cell.selectionStyle = .none
            if let restaurant = restaurant{
                cell.fill(with: restaurant)
            }
            

            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.photoCell, for: indexPath) as! PhotoTableViewCell
            cell.vc = self
            cell.photos = restaurant!.photos
            cell.selectionStyle = .none
            
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.addressCell, for: indexPath) as! AddressTableViewCell
            cell.selectionStyle = .none
            cell.addAnnotation(location: restaurant!.location, name: restaurant!.title)
            cell.addressLabel.text = restaurant!.address
            cell.phoneLabel.text = restaurant!.phone
            cell.cityLabel.text = restaurant!.city
            
            cell.addressView.isUserInteractionEnabled = true
            cell.addressView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openGoogleMap)))
            
            cell.phoneView.isUserInteractionEnabled = true
            cell.phoneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callTel)))
            
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.writeCommentCell, for: indexPath)

            cell.selectionStyle = .none
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.commentTableCell, for: indexPath) as! RestaurantCommentsTableViewCell
            cell.selectionStyle = .none
            cell.restId = restaurant?.id
            cell.fill()
            
            return cell
        }
        
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
        
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 {
            let commentNum = ((restaurant?.commentNum) != nil) ? restaurant!.commentNum : 0
            return CGFloat(180 * commentNum)
        } else {
            return UITableView.automaticDimension
        }
    }
    
 

    @objc func openGoogleMap(){
        let url = URL(string: "https://www.google.com/maps/dir/?api=1&destination=37.4192126,-121.9158089&destination_place_id=ChIJux4G0TrJj4ARus1eOZzOEz0")!
        
        let options = [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : false]
        UIApplication.shared.open(url, options: options, completionHandler: nil)
    }
    @objc func callTel(){

        let phone = restaurant!.phone
        print("try to call\(phone)")
        let url = URL(string: "tel://2678152136")!

        UIApplication.shared.open(url)
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */



}
