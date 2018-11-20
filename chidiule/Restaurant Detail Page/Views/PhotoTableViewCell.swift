//
//  PhotoTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/27.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var vc: RestaurantDetailTableViewController?
    var photos: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dstVC = storyboard.instantiateViewController(withIdentifier: "RestaurantPhotoGalleryCollectionViewController") as! RestaurantPhotoGalleryCollectionViewController
        dstVC.photoURLs = photos
        vc!.navigationController?.pushViewController(dstVC, animated: true)
//        dstVC.photos = objects[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.fill(with: photos[indexPath.item])
        
        return cell
    }

    

}
