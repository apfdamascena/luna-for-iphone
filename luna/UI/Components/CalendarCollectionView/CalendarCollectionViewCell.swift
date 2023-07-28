//
//  CalendarScrollCollectionViewCell.swift
//  luna
//
//  Created by gabrielfelipo on 25/07/23.
//

import UIKit
import SnapKit

class CalendarCollectionViewCell: UICollectionViewCell,
                                        AnyView,
                                        DrawableView {
    
    typealias ViewModel = CyclePhaseViewModel
    
    static let IDENTIFIER = "CalendarScrollCollectionViewCell"
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .equalCentering
        return view
    }()
    
    private let weekendDay: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        
        label.layer.opacity = 0.5
        label.text = "Q"
        label.textAlignment = .center

        label.draw(model)
        return label
    }()

    private let menstruationStatusToggle = UIView()
    
    private let cellStatus: UIImageView = {
        let imageView = UIImageView(image: Asset.noneSelected.image)
        return imageView
    }()
    

    private let monthDay: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        label.layer.opacity = 0.5
        label.text = "10"
        label.textAlignment = .center

        label.draw(model)
        return label
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
        stack.addArrangedSubview(weekendDay)
        stack.addArrangedSubview(menstruationStatusToggle)
        stack.addArrangedSubview(monthDay)
        addSubview(cellStatus)
    }
    
    func addConstraints() {
        menstruationStatusToggle.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(67)
            $0.width.equalTo(43)
        }
        
        stack.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(123)
            
        }
        
        monthDay.snp.makeConstraints{
            $0.bottom.equalToSuperview()
        }
        
        weekendDay.snp.makeConstraints{
            $0.top.equalToSuperview()
        }
        
        cellStatus.snp.makeConstraints{
            $0.edges.equalTo(menstruationStatusToggle)
        }
        
    }
    
    func addAdditionalConfiguration() {
        menstruationStatusToggle.backgroundColor = Asset.cinza100.color
    }
    
    func draw(_ model: CyclePhaseViewModel) {
        cellStatus.image = model.phase.image
        
//        menstruationStatusToggle.snp.makeConstraints{
//            $0.height.equalTo(model.focus == .selected ? 81 : 67)
//        }
//
//        menstruationStatusToggle.snp.makeConstraints{
//            $0.width.equalTo(model.focus == .selected ? 54 : 43)
//        }
        
//        menstruationStatusToggle.layer.cornerRadius = model.focus == .selected ? 27 : 22
        menstruationStatusToggle.layer.cornerRadius = 22
        
//        cellStatus.layer.opacity = model.focus == .selected ? 1 : 0.4
        
        cellStatus.layer.opacity = 0.4
        
        monthDay.layer.opacity = model.day.distance(to: .now) < 1 && model.day.distance(to: .now) > 0 ? 1 : 0.5
        
        weekendDay.layer.opacity = model.day.distance(to: .now) < 1 && model.day.distance(to: .now) > 0 ? 1 : 0.5
        
        let model = model.day.distance(to: .now) < 1 && model.day.distance(to: .now) > 0 ? LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                                                                                             weight: .bold) :
        LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        
        monthDay.draw(model)
        weekendDay.draw(model)
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.menstruationStatusToggle.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.cellStatus.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.cellStatus.layer.opacity = 1
            
        }
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
//            self.layer.borderWidth = 0
            self.menstruationStatusToggle.transform = CGAffineTransform.identity
            self.cellStatus.transform = CGAffineTransform.identity
            self.cellStatus.layer.opacity = 0.4
        }
    }

}
