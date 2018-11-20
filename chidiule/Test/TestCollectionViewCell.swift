//
//  TestCollectionViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/5.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
    }
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        
        return layoutAttributes
        
    }

}
