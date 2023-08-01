//
//  RxCalendarCollectionViewDelegateProxy.swift
//  luna
//
//  Created by alexdamascena on 01/08/23.
//

import Foundation


class RxCalendarCollectionViewDelegateProxy: CalendarCollectionViewDelegateProxy {
    
    func scrollViewDidScroll(_ scrollView: CalendarScrollCollectionView) -> CalendarCollectionViewCell? {
        
        guard let centerCell = scrollView.getCenterCell(on: scrollView) else { return nil }
        
        return centerCell
    }
}
