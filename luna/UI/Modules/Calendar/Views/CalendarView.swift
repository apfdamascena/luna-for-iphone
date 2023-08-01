//
//  CalendarView.swift
//  luna
//
//  Created by Cynara Costa on 21/07/23.
//

import UIKit
import SnapKit

class CalendarView: UIView, AnyView  {
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 2.su
        return view
    }()
    
    private let image: UIImageView = {
        let view = UIImageView(image: Asset.calendarImage.image)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private let title: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 28,
                                      color: .black,
                                      weight: .medium)
        
        label.text = L10n.Constants.Content.Label.calendarTitle
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let subtitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 16,
                                      color: .black,
                                      weight: .regular)
        
        label.numberOfLines = 0
        label.textAlignment = .left
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = (0.7).su
        let attributes: [NSAttributedString.Key: Any] = [.font: label.font, .paragraphStyle: paragraphStyle]
        label.attributedText = NSAttributedString(string: L10n.Constants.Content.Label.calendarSubtitle, attributes: attributes)
        
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
        addSubview(image)
        addSubview(stack)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(subtitle)
    }
    
    func addConstraints() {
        
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-17.su)
            $0.width.equalTo(20.su)
            $0.height.equalTo(20.su)
        }
        
        stack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(image.snp.bottom).offset(12.su)
            $0.width.equalTo(42.su)
            $0.height.equalTo(20.su)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CalendarView_Preview: PreviewProvider {
    static var previews: some View {
        CalendarView().showPreview()
    }
}

#endif
