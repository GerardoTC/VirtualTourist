//
//  PhotosLayoutFlow.swift
//  Virtual Tourist
//
//  Created by Gerardo Tarazona Caceres on 6/6/20.
//  Copyright © 2020 gerardo. All rights reserved.
//

import UIKit

class PhotosLayoutFlow: UICollectionViewFlowLayout {
    
    override func prepare() {
        let space:CGFloat = 15
        let dimension = ((collectionView?.frame.size.width ?? 0) - (2 * space) ) / 1.2
        minimumInteritemSpacing = space
        minimumLineSpacing = space
        itemSize = CGSize(width: dimension, height: (collectionView?.frame.size.height ?? 0) * 0.9)
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        scrollDirection = .horizontal
        super.prepare()
   
    }
}
