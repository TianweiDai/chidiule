//
//  CategoryCollectionViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/20.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CategoryCell"

class CategoryCollectionViewController: UICollectionViewController {
    
    @IBOutlet var categoryCollectionView: UICollectionView!
    var categories:[Category] = []
    var page: Int?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let itemSizeWidth = (UIScreen.main.bounds.width - 40)/4 - 10
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: itemSizeWidth, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        categoryCollectionView.collectionViewLayout = layout
        

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.imageView.image = categories[indexPath.item].image
        cell.nameLabel.text = categories[indexPath.item].name
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dstVC = storyboard?.instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        navigationController?.pushViewController(dstVC, animated: true)
        
        dstVC.cateId = String(page! * 8 + indexPath.item + 1)
        dstVC.cateStr = cell.nameLabel.text!
        
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
