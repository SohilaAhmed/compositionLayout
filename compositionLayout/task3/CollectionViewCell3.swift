//
//  CollectionViewCell3.swift
//  compositionLayout
//
//  Created by Sohila on 23/05/2023.
//

import UIKit

class CollectionViewCell3: UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
//        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
    }
}


