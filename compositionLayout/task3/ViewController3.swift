//
//  ViewController4.swift
//  compositionLayout
//
//  Created by Sohila on 23/05/2023.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var collectionView3: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView3.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        
        
        let verItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.5)))
        verItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 15, bottom: 12, trailing: 0)
        
        let verItem2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.5)))
        verItem2.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 15, bottom: 5, trailing: 0)
        
        let verticalGroup = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(0.3), height: .fractionalHeight(1), items: [verItem, verItem2])
        
        let horitem = CompositionalLayout.createItem(width: .fractionalWidth(0.7), height: .fractionalHeight(1), spacing: 5)
        
        let group = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(0.8), height: .fractionalHeight(0.46), items: [horitem, verticalGroup])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 20
        section.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}
extension ViewController3: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell3", for: indexPath) as! CollectionViewCell3
        return cell
    }
    
    
}
