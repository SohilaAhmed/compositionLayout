//
//  CollectionViewCell.swift
//  compositionLayout
//
//  Created by Sohila on 21/05/2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(image: UIImage){
        imageView.image = image
    }
}
