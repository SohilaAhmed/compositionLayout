//
//  CompositionalViewController.swift
//  compositionLayout
//
//  Created by Sohila on 22/05/2023.
//

import UIKit

class CompositionalViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
        //item
        let verItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.5), spacing: 5)
        let verticalGroup = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), items: [verItem])
        
        let horizontalGroup = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(0.5), height: .fractionalHeight(1), items: [verticalGroup, verticalGroup])
        
        
        let horitem = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 5)
        
        //group
        let group1 = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.5), items: [horitem, horizontalGroup])
        
        let group2 = CompositionalLayout.createGroup(aligment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.5), items: [horizontalGroup, horitem])
        
        let group = CompositionalLayout.createGroup(aligment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.7), items: [group1, group2])
        //section
        let section = NSCollectionLayoutSection(group: group)
        
        //return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}


extension CompositionalViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompositionalCollectionViewCell", for: indexPath) as! CompositionalCollectionViewCell
        return cell
    }
    
    
}
