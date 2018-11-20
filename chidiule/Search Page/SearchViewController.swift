//
//  SearchViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/17.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    

    @IBOutlet weak var keywordsCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var homeVC: UIViewController?

    var keywords: [String] = ["蛋糕", "美食撒的年纪啊是", "ktv", "丝芙兰", "iphone6s", "macbook", "电视机", "电冰箱"]
    var results: [String] = ["sad", "asdsad", "ewrqwer", "ewr", "fdasf"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.placeholder = "输入商户名，地点，菜名"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        
        searchBar.resignFirstResponder()
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.isEnabled = true
        }
        let cancelButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(cancelButtonAttributes, for: .normal)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "取消"
        
        
        
        keywordsCollectionView.dataSource = self
        keywordsCollectionView.delegate = self
        
        let itemSizeWidth = (UIScreen.main.bounds.width - 30)/4 - 5
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: itemSizeWidth, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.minimumInteritemSpacing = 5
        keywordsCollectionView.collectionViewLayout = layout
        
        // Do any additional setup after loading the view.
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text
        
        if(text != nil || text != ""){
            let dstVC = storyboard?.instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
            
            dstVC.searchInput = text
            dstVC.cateStr = text
            
            homeVC!.navigationController?.pushViewController(dstVC, animated: true)
            self.dismiss(animated: false, completion: nil)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! KeywordCollectionViewCell
        cell.keywordButton.setTitle(keywords[indexPath.item], for: .normal)
        
        return cell
    }
        
    


}
