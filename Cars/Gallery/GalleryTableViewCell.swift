//
//  GalleryTableViewCell.swift
//  Cars
//
//  Created by Mazen on 3/3/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {
    
    @IBOutlet var imgGallery: UIImageView!
    @IBOutlet var viewContent: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewContent.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
