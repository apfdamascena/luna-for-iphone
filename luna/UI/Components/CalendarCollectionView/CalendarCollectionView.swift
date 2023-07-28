//
//  CalendarScrollView.swift
//  luna
//
//  Created by gabrielfelipo on 25/07/23.
//

import UIKit

class CalendarScrollCollectionView: UICollectionView {

    private(set) var  collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 43, height: 123)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.backgroundColor = .clear
        collection.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.IDENTIFIER)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

}
