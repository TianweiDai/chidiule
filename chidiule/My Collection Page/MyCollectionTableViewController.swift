//
//  MyCollectionTableViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/6.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class MyCollectionTableViewController: UITableViewController {
    
    var collections: [Restaurant] = []
    let starImages = ["regular_0", "regular_1", "regular_1_half", "regular_2", "regular_2_half", "regular_3", "regular_3_half", "regular_4", "regular_4_half", "regular_5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的收藏"
        downloadData()
    }
    
    
    func downloadData(){
        let url = URL(string: "http://ec2-54-183-149-40.us-west-1.compute.amazonaws.com/api/search")
        
        let params : [String : String] = ["cate" : "1"]
        Alamofire.request(url!, method: .get, parameters: params).responseJSON { (response) in
            if response.result.isSuccess{
                let json: JSON = JSON(response.result.value!)
                for (_,restaurant):(String, JSON) in json{
                    let title = restaurant["name"].string!
                    let address = restaurant["address"].string! + ", " + restaurant["city"].string!
                    let id = restaurant["id"]
                    let review_count = restaurant["comments_num"]
                    let referer = restaurant["referer"].string!
                    let category = restaurant["category"].string!
                    let distance = restaurant["distance"].float!
                    let price = restaurant["price"].string!
                    let photo_url = restaurant["photos"][0]["photo_thumb_url"].string!
                    let star = restaurant["star"].int! - 1
                    let open = restaurant["open"].string != nil ? "营业中" : "休息中"
                    var photos: [String] = []
                    for (_, photo):(String, JSON) in restaurant["photos"] {
                        photos.append(photo["photo_thumb_url"].string!)
                    }
                    let location = CLLocation(latitude: CLLocationDegrees(restaurant["latitude"].float!), longitude: CLLocationDegrees(restaurant["longitude"].float!))
                    let city = restaurant["city"].string!
                    let phone = restaurant["tel"].string!
                    let commentNum = restaurant["comments_num"].int!
                    
                    
                    
                    
                    self.collections.append(Restaurant(id: "\(id)", title: title, address: address, photo_url: photo_url, star: UIImage(named: self.starImages[star])!, review: "\(review_count)条", referrer: referer, category: category, open: open, distance: "\(distance)公里", price: price, photos: photos, location: location, phone: phone, city: city, commentNum: commentNum))
                    
                }
                self.tableView.reloadData()
                
                
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return collections.count
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCollectionTableViewCell
        cell.fill(restaurant: collections[indexPath.item])

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 200
//    }
    

  

}
