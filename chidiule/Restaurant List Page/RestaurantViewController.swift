//
//  RestaurantViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/12.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class RestaurantViewController: UIViewController {
        

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterBarView: UIStackView!
    var cateId: String?
    var cateStr: String?
    var searchInput: String?
    var objects: [Restaurant] = []
    let starImages = ["regular_0", "regular_1", "regular_1_half", "regular_2", "regular_2_half", "regular_3", "regular_3_half", "regular_4", "regular_4_half", "regular_5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Restaurants"
        setup()
        fill()
        
    }
    
    
    @IBAction func sortByDistance(_ sender: Any) {
        let button = sender as! RoundedButton
        button.isActive = !button.isActive
        if(button.isActive) {
            button.layer.backgroundColor = UIColor.red.cgColor
            button.setTitleColor(UIColor.white, for: .normal)
            
            if(button.tag == 1){
                print("tag1")
            }
            else if(button.tag == 2){
                print("tag2")
            }
            else if(button.tag == 3){
                print("tag3")
            }
            else if(button.tag == 4){
                print("tag4")
            }

            
//            objects.sort { (rest1, rest2) -> Bool in
//                return rest1.distance < rest2.distance
//            }
//            collectionView.reloadData()


        }
        else{
            button.layer.backgroundColor = UIColor.white.cgColor
            button.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    func fill(){
        let url = URL(string: "http://ec2-54-183-149-40.us-west-1.compute.amazonaws.com/api/search")
        
        var params : [String : String] = [:]
        if let cateId = cateId {
            params.updateValue(cateId , forKey: "cate")
        }
        if let searchInput = searchInput {
            params.updateValue(searchInput, forKey: "search_input")
        }
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
                                        
                    
                    
                                        
                    self.objects.append(Restaurant(id: "\(id)", title: title, address: address, photo_url: photo_url, star: UIImage(named: self.starImages[star])!, review: "\(review_count)条", referrer: referer, category: category, open: open, distance: "\(distance)公里", price: price, photos: photos, location: location, phone: phone, city: city, commentNum: commentNum))
                    
                }
                self.tableView.reloadData()
                
                
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
        
        
        
    }
    func setup(){
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
//            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
//        }
//        collectionView.backgroundColor = UIColor.red
        tableView.dataSource = self
        tableView.delegate = self
        
        addFilterBarBottomBorder()
        self.title = cateStr
        
    }

    func addFilterBarBottomBorder(){
        let border = CALayer()
        let height = filterBarView.bounds.height
        let width = filterBarView.bounds.width

        let thickness = 1/UIScreen.main.nativeScale

        border.frame = CGRect(x: 0, y: height - thickness, width: width + 40, height: thickness)
        border.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        
        filterBarView.layer.addSublayer(border)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem

    }

}
extension RestaurantViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantCell
        let restaurant = objects[indexPath.item]
        cell.fill(with: restaurant)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dstVC = storyboard!.instantiateViewController(withIdentifier: "RestaurantDetailTableViewController") as! RestaurantDetailTableViewController
        self.navigationController?.pushViewController(dstVC, animated: true)
        dstVC.restaurant = objects[indexPath.item]

    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
}
