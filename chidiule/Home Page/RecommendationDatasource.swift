//
//  RecommendationDatasource.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/23.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//
import UIKit

class RecommendationDatasource: NSObject, UICollectionViewDataSource {
//    struct Article {
//        var image: UIImage
//        var title: String
//        var content: String
//    }
    var objects: [Article] = [
        Article(coverImage: UIImage(named: "meet-fresh")!, title: "鲜芋仙来东湾开店啦", content: "没想到昨天有人告诉我，鲜芋仙居然来东湾了，小伙伴快去瞧瞧啊"),
        Article(coverImage: UIImage(named: "afternoon-tea-p")!, title: "LA最好下午茶", content: "小溪最近发现，小姐妹之间约咖啡、英式下午茶越来越流行追求精致、美味健康，又有逼格好拍照，又可以避免胡吃海塞长肥肉。在这阳光明媚的大好天气，你温暖的微笑融化在晴朗的艳阳天里，融入美味的茶点中小溪最近发现，小姐妹之间约咖啡、英式下午茶越来越流行追求精致、美味健康，又有逼格好拍照，又可以避免胡吃海塞长肥肉.在这阳光明媚的大好天气，你温暖的微笑融化在晴朗的艳阳天里，融入美味的茶点中"),
        Article(coverImage: UIImage(named: "volauvent")!, title: "LA 高端米其林餐厅", content: "关于洛杉矶整个被移除米其林红宝书的原因，众说纷纭。小溪真的抱着好奇心去试了三五家2009年的前任米其林，结果其实每一家都挺失望的")
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendationCell", for: indexPath) as! RecommendationCollectionViewCell
//        let articles = objects[indexPath.item]
        cell.imageView.image = objects[indexPath.row].coverImage
        cell.contentLabel.text = objects[indexPath.row].content
        cell.titleLabel.text = objects[indexPath.row].title
        return cell
    }
}

