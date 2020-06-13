//
//  PhotoViewCell.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/6/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView! {didSet {
        image.layer.cornerRadius = 16.0
        image.contentMode = .scaleAspectFill
        }}
    @IBOutlet weak var text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
