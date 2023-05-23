//
//  ViewController.swift
//  compositionLayout
//
//  Created by Sohila on 21/05/2023.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let images: [UIImage] = Array(1...11).map{ UIImage(named: String($0))!}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewCompositionalLayout{
        //item
        let firstItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .absolute(100), spacing: 1)
        
        let verItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.5), spacing: 1)
        let verticalGroup = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), items: [verItem, verItem])
        
        let horitem = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 1)
        let horizontalGroup = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .absolute(300), items: [horitem, verticalGroup])
        
        //group
        let group = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(1), height: .absolute(400), items: [firstItem, horizontalGroup])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.setup(image: images[indexPath.row])
        return cell
    }
    
    
}
