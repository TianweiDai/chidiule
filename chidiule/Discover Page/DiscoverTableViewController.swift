
//
//  DiscoverTableViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/6.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class DiscoverTableViewController: UITableViewController {

    var articles = [
        Article(coverImage: UIImage(named: "meet-fresh")!, title: "鲜芋仙来东湾开店啦", content: "没想到昨天有人告诉我，鲜芋仙居然来东湾了，小伙伴快去瞧瞧啊"),
        Article(coverImage: UIImage(named: "afternoon-tea-p")!, title: "LA最好下午茶", content: "小溪最近发现，小姐妹之间约咖啡、英式下午茶越来越流行追求精致、美味健康，又有逼格好拍照，又可以避免胡吃海塞长肥肉。在这阳光明媚的大好天气，你温暖的微笑融化在晴朗的艳阳天里，融入美味的茶点中小溪最近发现，小姐妹之间约咖啡、英式下午茶越来越流行追求精致、美味健康，又有逼格好拍照，又可以避免胡吃海塞长肥肉.在这阳光明媚的大好天气，你温暖的微笑融化在晴朗的艳阳天里，融入美味的茶点中"),
        Article(coverImage: UIImage(named: "volauvent")!, title: "LA 高端米其林餐厅", content: "关于洛杉矶整个被移除米其林红宝书的原因，众说纷纭。小溪真的抱着好奇心去试了三五家2009年的前任米其林，结果其实每一家都挺失望的")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "发现"

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DiscoverTableViewCell
        cell.fill(article: articles[indexPath.item])

        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
