//
//  MonthTag.swift
//  luna
//
//  Created by alexdamascena on 10/08/23.
//

import UIKit

class MonthTag: UIStackView, AnyView {
    
    public var day: String = Date.now.formatDayToString()
    public var month: String = Date.now.formatMonthToString()
    
    private let iconCalendar: UIImageView = {
        let view = UIImageView(image: Asset.calendarIcon.image)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    public var monthText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .regular)
        let day = ""
        label.text = ("\(Date.now.formatMonthToString().lowercased())")
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    public var dayText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .regular)
        label.text = ("\(Date.now.formatDayToString()) de")
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addArrangedSubview(iconCalendar)
        addArrangedSubview(dayText)
        addArrangedSubview(monthText)
    }

    func addAdditionalConfiguration() {
        backgroundColor = .red
        dayText.backgroundColor = .blue
        iconCalendar.backgroundColor = .green
        monthText.backgroundColor = .yellow
        
//
//        iconCalendar.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        dayText.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        monthText.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        monthText.setContentHuggingPriority(.defaultLow, for: .horizontal)
        dayText.setContentHuggingPriority(.defaultLow, for: .horizontal)
        iconCalendar.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        
        
        axis = .horizontal
        alignment = .fill
        spacing = 1.su
    }
}
