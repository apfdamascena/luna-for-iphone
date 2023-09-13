//
//  ActivityCell.swift
//  luna
//
//  Created by alexdamascena on 12/09/23.
//

import UIKit


class ActivityCell: UIView, AnyView {
    
    private let descriptionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .fill
        return stack
    }()
    
    private let information = UIView()
    
    private let title: LunaText = {
        let label = LunaText()
        label.text = "Praia"
        let model = LunaTextViewModel(size: 17,
                                      color: Asset.gray950.color,
                                      weight: .regular)
        label.draw(model)
        return label
    }()
    
    private let dateDescriptionView = UIView()
    
    private let cyclePhaseImage: UIImageView = {
        return UIImageView(image: Asset.phaseActivityCell.image)
    }()
    
    private let calendarIcon: UIImageView = {
        let image = UIImage(systemName: "calendar")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        view.tintColor = Asset.gray500.color
        return view
    }()

    private let date: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 12,
                                      color: Asset.gray500.color,
                                      weight: .regular)
        label.draw(model)
        label.text = "23 de setembro •"
        return label
    }()
    
    private let hour: UIImageView = {
        let image = UIImage(systemName: "clock")
        let view = UIImageView(image: image)
        view.tintColor = Asset.gray500.color
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let hourDescription: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 12,
                                      color: Asset.gray500.color,
                                      weight: .regular)
        label.draw(model)
        label.text = "8:00 - 11:00"
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
        addSubview(cyclePhaseImage)
        addSubview(information)
        
        information.addSubview(title)
        information.addSubview(calendarIcon)
        information.addSubview(date)
        information.addSubview(hour)
        information.addSubview(hourDescription)
    }
    
    func addConstraints() {
        
        cyclePhaseImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(1.su)
            $0.leading.equalToSuperview().offset(1.5.su)
            $0.width.equalTo(40)
        }
        
        information.snp.makeConstraints {
            $0.leading.equalTo(cyclePhaseImage.snp.trailing).offset(1.5.su)
            $0.top.bottom.trailing.equalToSuperview().inset(19)
        }
        
        title.snp.makeConstraints{
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(0.2.su)
        }
        
        calendarIcon.snp.makeConstraints{
            $0.top.equalTo(title.snp.bottom).offset(0.5.su)
            $0.leading.equalTo(cyclePhaseImage.snp.trailing).offset(1.5.su)
            $0.height.equalTo(14)
            $0.width.equalTo(15)
        }
        
        date.snp.makeConstraints{
            $0.leading.equalTo(calendarIcon.snp.trailing).offset(0.5.su)
            $0.width.greaterThanOrEqualTo(80)
            $0.top.equalTo(calendarIcon)

        }
        
        hour.snp.makeConstraints{
            $0.leading.equalTo(date.snp.trailing).offset(0.5.su)
            $0.height.equalTo(14)
            $0.width.equalTo(15)
            $0.top.equalTo(calendarIcon)
        }
        
        hourDescription.snp.makeConstraints{
            $0.leading.equalTo(hour.snp.trailing).offset(0.5.su)
            $0.top.equalTo(calendarIcon)
        }
    
    
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = Asset.gray50.color
        layer.masksToBounds = true
        layer.cornerRadius = 8
    }
}
