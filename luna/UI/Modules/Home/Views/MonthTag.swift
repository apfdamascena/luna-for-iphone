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
    
    public var monthText: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 20, color: .black, weight: .regular)
        label.text = Date.now.formatMonthToString().capitalized
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
        addArrangedSubview(monthText)
    }

    func addAdditionalConfiguration() {
        
        axis = .horizontal
        alignment = .leading
        spacing = 1.su
    }
}
