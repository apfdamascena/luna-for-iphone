//
//  ReferencesViewController.swift
//  luna
//
//  Created by gabrielfelipo on 08/08/23.
//

import UIKit
import RxSwift

enum ReferenceElementCard {
    case first, second, third, fourth, fifth
    
    init(value: Int){
        switch value {
        case 0:
            self = .first
        case 1:
            self = .second
        case 3:
            self = .third
        case 4:
            self = .fourth
        default:
            self = .fifth
        }
    }
    
    var link: String {
        switch self {
        case .first:
            return L10n.Constants.Content.Label.Home.Link.References.first
        case .second:
            return L10n.Constants.Content.Label.Home.Link.References.second
        case .third:
            return L10n.Constants.Content.Label.Home.Link.References.third
        case .fourth:
            return L10n.Constants.Content.Label.Home.Link.References.fourth
        default:
            return L10n.Constants.Content.Label.Home.Link.References.fifth
        }
    }
}

class ReferencesViewController: UIViewController {
    
    private let referencesView = ReferencesSheetView()
    
    private var disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = referencesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Referências"
        addReferenceCardTriggerToWeb()
    }
    
    func addReferenceCardTriggerToWeb(){
        
        let observables = [referencesView.firstReference, referencesView.secondReference,
         referencesView.thirdReference, referencesView.fourthReference,
         referencesView.fifthReference
        ].map{ view in
            let tapGesture = UITapGestureRecognizer()
            view.addGestureRecognizer(tapGesture)
            return tapGesture
        }
        
        Observable.merge(
            observables[0].rx.event.map { _ in ReferenceElementCard(value: 0) },
            observables[1].rx.event.map { _ in ReferenceElementCard(value: 1) },
            observables[2].rx.event.map { _ in ReferenceElementCard(value: 2)},
            observables[3].rx.event.map { _ in ReferenceElementCard(value: 3)},
            observables[4].rx.event.map { _ in ReferenceElementCard(value: 4)}
        )
        .map{ $0.link }
        .subscribe(onNext: { link in
            print("index: \(link)")
        })
        .disposed(by: disposeBag)
    }

}
