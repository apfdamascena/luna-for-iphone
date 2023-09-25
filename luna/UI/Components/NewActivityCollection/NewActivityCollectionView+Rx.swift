//
//  NewActivityCollectionView+Rx.swift
//  luna
//
//  Created by Cynara Costa on 20/09/23.
//

import RxSwift

extension Reactive where Base: NewActivityCollectionView {
    
    var selectItemAtCollection: Observable<(String?)> {
        self.base.rx.itemSelected
            .map { indexPath in
                self.base.getSelectedNumber(at: indexPath)
            }.asObservable()
    }
    
}
