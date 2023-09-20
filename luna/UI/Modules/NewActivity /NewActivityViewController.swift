//
//  NewActivityViewController.swift
//  luna
//
//  Created by Cynara Costa on 11/09/23.
//  
//

import UIKit
import RxSwift
import RxCocoa

class NewActivityViewController: UIViewController {
    
    private let newActivityView = NewActivityView()
    
    var presenter: ViewToPresenterNewActivityProtocol?
    
    private var disposeBag = DisposeBag()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil , bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = newActivityView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        firstTimeContinueButtonTouchTrigger()
        selectedStressCollectionNumber()
        selectedSociabilityCollectionNumber()
        selectedFisicsCollectionNumber()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = L10n.Constants.Content.Label.NewActivity.Nav.title
//        self.navigationController?.addCustomBottomLine(color: Asset.gray100.color, height: 1)
    }
    
    func firstTimeContinueButtonTouchTrigger() {
        newActivityView.button
            .rx
            .tap.bind {
                self.presenter?.userTappedContinueButton()
            }.disposed(by: disposeBag)
    }
    
    func selectedStressCollectionNumber() {
        newActivityView.metricsComponent.stressCollectionView
            .rx.selectItemAtCollection
            .subscribe(onNext: { numberSelected in
                print("Stress: \(numberSelected)")
            }).disposed(by: disposeBag)
            
    }
    
    func selectedSociabilityCollectionNumber() {
        newActivityView.metricsComponent.sociabilityCollectionView
            .rx.selectItemAtCollection
            .subscribe(onNext: { numberSelected in
                print("Sociability: \(numberSelected)")
            }).disposed(by: disposeBag)
    }
    
    func selectedFisicsCollectionNumber() {
        newActivityView.metricsComponent.fisicsCollectionView
            .rx.selectItemAtCollection
            .subscribe(onNext: { numberSelected in
                print("Fisics: \(numberSelected)")
            }).disposed(by: disposeBag)
    }
    
}

extension NewActivityViewController: PresenterToViewNewActivityProtocol{
    // TODO: Implement View Output Methods
}

extension UINavigationController
{
    func addCustomBottomLine(color: UIColor,height: Double)
    {
        //Hiding Default Line and Shadow
        navigationBar.setValue(true, forKey: "hidesShadow")

        //Creating New line
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: height))
        lineView.backgroundColor = color
        navigationBar.addSubview(lineView)

        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.widthAnchor.constraint(equalTo: navigationBar.widthAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        lineView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
    }
}




