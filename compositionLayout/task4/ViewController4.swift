//
//  ViewController4.swift
//  compositionLayout
//
//  Created by Sohila on 23/05/2023.
//

import UIKit

class ViewController4: UIViewController {

    @IBOutlet weak var collectionView4: UICollectionView!
    
    private let images: [UIImage] = Array(1...14).map{ UIImage(named: String($0))!}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView4.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewCompositionalLayout{
        //item
        let firstItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.35), spacing: 3)
        
        let verItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.5), spacing: 3)
        let verticalGroup = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(0.34), height: .fractionalHeight(1), items: [verItem, verItem])
        
        let horitem = CompositionalLayout.createItem(width: .fractionalWidth(0.66), height: .fractionalHeight(1), spacing: 3)
        let horizontalGroup = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.25), items: [horitem, verticalGroup])
        
        
        let item3 = CompositionalLayout.createItem(width: .fractionalWidth(1/3), height: .fractionalHeight(1), spacing: 3)
        let group3 = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.15), items: [item3])
        
        let group4 = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.25), items: [verticalGroup, horitem])
        
        //group
        let group = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(1), items: [firstItem, horizontalGroup, group3, group4])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}


extension ViewController4: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell4", for: indexPath) as! CollectionViewCell4
        cell.setup(image: images[indexPath.row])
        return cell
    }
    
    
}
