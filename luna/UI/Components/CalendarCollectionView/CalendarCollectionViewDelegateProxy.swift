//
//  CalendarCollectionViewDelegateProxy.swift
//  luna
//
//  Created by alexdamascena on 01/08/23.
//

import Foundation

protocol CalendarCollectionViewDelegateProxy {
    
    func scrollViewDidScroll(_ scrollView: CalendarScrollCollectionView) -> CalendarCollectionViewCell?
    
}
