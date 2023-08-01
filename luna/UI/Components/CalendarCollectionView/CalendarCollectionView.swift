//
//  CalendarScrollView.swift
//  luna
//
//  Created by gabrielfelipo on 25/07/23.
//

import UIKit

class CalendarScrollCollectionView: UICollectionView, AnyView {
    
    init(){
        let layout = CalendarCollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.IDENTIFIER)
        showsHorizontalScrollIndicator = false
    }
    
    func getSelectedAndCenterCell(at indexPath: IndexPath) -> (CalendarCollectionViewCell?, CalendarCollectionViewCell?, CGFloat? ) {
        
        guard let selectedCell = cellForItem(at: indexPath) as? CalendarCollectionViewCell  else {
            return  (nil , nil, nil)
        }
        
        let centerPoint = CGPoint(x: frame.size.width / 2 + contentOffset.x,
                                  y: frame.size.height / 2 + contentOffset.y)
        
        guard let centerIndex = indexPathForItem(at: centerPoint),
              let centerCell = cellForItem(at: centerIndex) as?  CalendarCollectionViewCell else {
            return (nil, nil, nil)
        }
        
        let centerXtoCollection = selectedCell.center.x - 5.5 - frame.size.width / 2
        
        return (selectedCell, centerCell, centerXtoCollection)
    }
    
    func getCenterCell(on scroll: UIScrollView) -> CalendarCollectionViewCell? {
        
        let centerPoint = CGPoint(x: frame.size.width / 2 + scroll.contentOffset.x,
                                  y: frame.size.height / 2 + scroll.contentOffset.y)
        
        guard let indexPath = indexPathForItem(at: centerPoint) else { return nil }
        
        let centerCell = cellForItem(at: indexPath) as? CalendarCollectionViewCell
        
        return centerCell
        
    }
}
