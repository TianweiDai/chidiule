//
//  RestaurantCommentsTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/27.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RestaurantCommentsTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var commentTableView: UITableView!
    var restId: String?
    
    struct Comment {
        var comment: String
        var time: String
        var username: String
        var headPic: String
        var star: UIImage
        
    }
    let starImages = ["regular_1", "regular_2", "regular_3", "regular_4", "regular_5"]

    var comments: [Comment] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        commentTableView.dataSource = self
        commentTableView.delegate = self
    }

    func fill() {
        if(comments.count == 0){
            let url = URL(string: "http://ec2-54-183-149-40.us-west-1.compute.amazonaws.com/api/comment")
            
            let params : [String : String] = ["id" : restId!]
            Alamofire.request(url!, method: .get, parameters: params).responseJSON { (response) in
                if response.result.isSuccess{
                    
                    let json: JSON = JSON(response.result.value!)
                    for (_,comment):(String, JSON) in json{
                        let content = comment["comment"].string!
                        let star = comment["star"].int! - 1
                        let username = comment["user"]["name"].string!
                        let headImageUrl = comment["user"]["thumb_head_image"].string!
                        let time = comment["created_at"].string!
                        self.comments.append(Comment(comment: content, time: time, username: username, headPic: headImageUrl, star: UIImage(named: self.starImages[star])!))
                    }
                    self.commentTableView.reloadData()
                    
                    
                    
                }
                else {
                    print("Error \(String(describing: response.result.error))")
                }
            }
            

        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let comment = comments[indexPath.item]
        var height: CGFloat = 0.0
        let size = CGSize(width: self.frame.width - 40, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let estimateFrame = NSString(string: comment.comment).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        height = 120 + estimateFrame.height
        return height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = comments[indexPath.item]
        cell.commentContentLabel.text = comment.comment
        cell.usernameLabel.text = comment.username
        cell.timeLabel.text = comment.time
        cell.starImage.image = comment.star
        if (comment.headPic != "") {
            if let photo_url = URL(string: comment.headPic){
                cell.profileImage.sd_setImage(with: photo_url, placeholderImage: UIImage(named: "gray_background_image"))

            }
            
        }
        
        
        
        return cell
    }
}

