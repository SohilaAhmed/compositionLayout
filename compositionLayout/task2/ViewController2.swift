//
//  ViewController2.swift
//  compositionLayout
//
//  Created by Sohila on 22/05/2023.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var collectionView2: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView2.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        //item
        let verItem = CompositionalLayout.createItem(width: .fractionalWidth(1/3), height: .fractionalHeight(1), spacing: 5)
        let verticalGroup = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.3), items: [verItem])
        
        let horItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.5), spacing: 5)
        let horizontalGroup = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(1/3), height: .fractionalHeight(1), items: [horItem])
        
        let midItem = CompositionalLayout.createItem(width: .fractionalWidth(1/3), height: .fractionalHeight(1), spacing: 5)

        let group2 = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.7), items: [horizontalGroup, midItem, horizontalGroup])

        
        let group = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.6), items: [verticalGroup, group2])
 
        //section
        let section = NSCollectionLayoutSection(group: group)
        
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}
extension ViewController2: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
        return cell
    }
    
    
}
