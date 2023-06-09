//
//  CompositionalLayout.swift
//  compositionLayout
//
//  Created by Sohila on 21/05/2023.
//

import UIKit

enum CompositionGroupAligment{
    case vertical
    case horizontal
}

struct CompositionalLayout{
    
    static func createItem(width: NSCollectionLayoutDimension,
                           height: NSCollectionLayoutDimension,
                           spacing: CGFloat) -> NSCollectionLayoutItem{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                             heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item
    }
    
    static func createGroup(aligment: CompositionGroupAligment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup{
        switch aligment{
        case .vertical:
            return NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                   heightDimension: height),
                subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                   heightDimension: height),
                subitems: items)
        }
    }
    
    static func createGroup(aligment: CompositionGroupAligment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            item: NSCollectionLayoutItem,
                            count: Int) -> NSCollectionLayoutGroup{
        switch aligment{
        case .vertical:
            return NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                   heightDimension: height),
                subitem: item,
                count: count)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                   heightDimension: height),
                subitem: item,
                count: count)
        }
    }
}
