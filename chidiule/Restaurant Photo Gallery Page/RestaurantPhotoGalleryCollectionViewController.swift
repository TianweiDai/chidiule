//
//  RestaurantPhotoGalleryCollectionViewController.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/31.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RestaurantPhotoGalleryCollectionViewController: UICollectionViewController {
    
    var photoURLs: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "图片"
        let screenWidth = UIScreen.main.bounds.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        let width = (screenWidth - 15)/2
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        collectionView!.collectionViewLayout = layout
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoURLs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RestaurantPhotoGalleryCollectionViewCell
        cell.photoGalleryController = self
        let url = URL(string: photoURLs[indexPath.row])
        cell.imageView!.sd_setImage(with: url, placeholderImage: UIImage(named: "gray_background_image"))
        
        
        return cell
    }
    var startingFrame: CGRect?
    var blackBackgroundView: UIView?
    var zoomingImageView: UIImageView?
    @objc func performZoomOut(){
        
        if let zoomOutImageView = zoomingImageView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                zoomOutImageView.frame = self.startingFrame!
                
                self.blackBackgroundView?.alpha = 0
                zoomOutImageView.alpha = 0


            }) { (completed: Bool) in
                zoomOutImageView.removeFromSuperview()
                self.blackBackgroundView?.removeFromSuperview()
            }
        }
    }

    func performZoomInForStartingImageView(startingImageView: UIImageView){
        self.startingFrame = startingImageView.superview?.convert(startingImageView.frame, to: nil)
        zoomingImageView = UIImageView(frame: startingFrame!)
        zoomingImageView!.contentMode = .scaleAspectFill
        zoomingImageView!.backgroundColor = UIColor.red
        zoomingImageView!.image = startingImageView.image
        zoomingImageView!.isUserInteractionEnabled = true
        zoomingImageView!.alpha = 0
        zoomingImageView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(performZoomOut)))
        
        
        if let keywindow = UIApplication.shared.keyWindow{
        
            self.blackBackgroundView = UIView(frame: keywindow.frame)
            self.blackBackgroundView!.backgroundColor = UIColor.black
            self.blackBackgroundView!.alpha = 0
            self.blackBackgroundView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(performZoomOut)))
            keywindow.addSubview(self.blackBackgroundView!)
            
            keywindow.addSubview(zoomingImageView!)

            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackBackgroundView!.alpha = 1
                
                let height = startingImageView.image!.size.height / startingImageView.image!.size.width * keywindow.frame.width
                self.zoomingImageView!.frame = CGRect(x: 0, y: 0, width: keywindow.frame.width, height: height)
                self.zoomingImageView!.center = keywindow.center
                self.zoomingImageView!.alpha = 1
                }, completion: nil)
        }
        
        
    }
        

}
