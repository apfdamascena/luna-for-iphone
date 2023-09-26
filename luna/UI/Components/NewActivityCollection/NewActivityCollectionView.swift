//
//  NewActivityCollectionView.swift
//  luna
//
//  Created by Cynara Costa on 19/09/23.
//

import UIKit
import SnapKit

class NewActivityCollectionView: UICollectionView, AnyView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let screenWidth = UIScreen.main.bounds.width
    
    let identifier: String
    
    init(with identifier: String) {
        
        let screenWidth = UIScreen.main.bounds.width
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = screenWidth * 0.04
        self.identifier = identifier
        
        super.init(frame: .zero, collectionViewLayout: layout)
        setupView()
        backgroundColor = .clear
        isScrollEnabled = false
        self.register(
            NewActivityCollectionViewCell.self,
            forCellWithReuseIdentifier: identifier
        )

        self.delegate = self
        self.dataSource = self
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getSelectedNumber(at indexPath: IndexPath) -> String {
        guard let selectCell = self.cellForItem(at: indexPath) as? NewActivityCollectionViewCell else {return "0"}
        guard let numberLabel = selectCell.numberLabel.text else { return "0" }
        
        return numberLabel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath
        ) as! NewActivityCollectionViewCell
        cell.configure(label: "\(indexPath.row + 1)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectedCell?.contentView.backgroundColor = Asset.red100.color
        selectedCell?.contentView.layer.borderColor = Asset.red400.color.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cellToDeselect = collectionView.cellForItem(at: indexPath)
        cellToDeselect?.contentView.backgroundColor = .white
        cellToDeselect?.contentView.layer.borderColor = Asset.gray200.color.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = self.frame.size.height
        return CGSize(width: screenWidth * 0.123, height: height)
    }
    
}

