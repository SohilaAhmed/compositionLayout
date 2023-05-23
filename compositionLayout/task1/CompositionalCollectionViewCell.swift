//
//  CompositionalCollectionViewCell.swift
//  compositionLayout
//
//  Created by Sohila on 22/05/2023.
//

import UIKit

class CompositionalCollectionViewCell: UICollectionViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
       
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
    }
}


