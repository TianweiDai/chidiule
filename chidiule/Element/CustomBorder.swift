
//
//  CustomBorder.swift
//  chidiule
//
//  Created by Guest1 on 2018/11/13.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    
    func addBorder(edge: UIRectEdge) {
        
        let border = CALayer()
        let thickness: CGFloat = 1/UIScreen.main.nativeScale
        let color: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width + 40, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        addSublayer(border)
    }
}

