//
//  InformationalPhase.swift
//  luna
//
//  Created by Cynara Costa on 29/07/23.
//

import UIKit
import SnapKit

class HomeLearnView: UIView, AnyView {
    
    private let menstruation: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Menstruação"
        container.subtitle.text = "Você está literalmente sangrando. O revestimento interno do seu útero (endométrio) está sendo eliminado."
        return container
    }()
    
    private let folicular: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Fase Folicular"
        container.subtitle.text = "A preparação começou! Os folículos ovarianos estão amadurecerecendo."
        return container
    }()
    
    private let fertile: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Ovulação"
        container.subtitle.text = "Seu óvulo foi liberado! Ele tá pronto para ser fertilizado por um espermatozoide."
        return container
    }()
    
    private let luteal: CardHomeInformation = {
        let container = CardHomeInformation()
        container.title.text = "Fase Lútea"
        container.subtitle.text = "O folículo que liberou o óvulo agora é um corpo lúteo. Hormônios em alta!"
        return container
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(stack)
        stack.addArrangedSubview(menstruation)
        stack.addArrangedSubview(folicular)
        stack.addArrangedSubview(fertile)
        stack.addArrangedSubview(luteal)
    }
    
    func addConstraints() {
        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func phasesText(){
        
    }
    
}
