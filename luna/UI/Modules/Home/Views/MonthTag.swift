//
//  MonthTag.swift
//  luna
//
//  Created by alexdamascena on 10/08/23.
//

import UIKit

class MonthTag: UIStackView, AnyView {
    
    private let iconCalendar: UIImageView = {
        let view = UIImageView(image: Asset.calendarIcon.image)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    public var dateText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 17, color: .black, weight: .regular)
        label.text = ("\(Date.now.formatDayToString().lowercased()) de \(Date.now.formatMonthToString().lowercased())")
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
        addArrangedSubview(dateText)
    }

    func addAdditionalConfiguration() {
        axis = .horizontal
        alignment = .fill
        spacing = 1.su
    }
    
    func formattText(day: String, month: String) {
        if (Locale.current.language.languageCode?.identifier != "pt") {
            dateText.text = ("\(month), \(day)")
        } else {
            dateText.text = ("\(day) de \(month)")
        }
        
    }
    
    
}
