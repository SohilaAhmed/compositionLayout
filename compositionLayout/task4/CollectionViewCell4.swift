//
//  CollectionViewCell4.swift
//  compositionLayout
//
//  Created by Sohila on 23/05/2023.
//

import UIKit

class CollectionViewCell4: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    func setup(image: UIImage){
        imgView.image = image
    }
}
