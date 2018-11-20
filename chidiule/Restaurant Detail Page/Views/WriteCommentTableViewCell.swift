//
//  WriteCommentTableViewCell.swift
//  chidiule
//
//  Created by Guest1 on 2018/10/31.
//  Copyright © 2018 TechOcean LLC. All rights reserved.
//

import UIKit

class WriteCommentTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        openWriteCommentPage()
        // Configure the view for the selected state
    }
    func openWriteCommentPage(){
        print("open write comment")
    }

}
