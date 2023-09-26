//
//  DatePickersStack.swift
//  luna
//
//  Created by gabrielfelipo on 22/09/23.
//

import UIKit
import SnapKit

class DatePickersStack: UIStackView, AnyView {
    
    private let initialDateTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 17, color: Asset.gray950.color, weight: .regular)
        label.text = L10n.Constants.Content.Label.NewActivity.CreateEvent.initialDateTitle
        label.addLineHeight(of: 24)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let initialPickerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.backgroundColor = Asset.gray50.color
        
        return stack
    }()
    
    private let finalPickerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.backgroundColor = Asset.gray50.color
        
        return stack
    }()
    
    public let finalDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = Asset.red500.color
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        datePicker.subviews.first?.subviews.forEach { grayView in
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = Asset.gray50.color
            grayView.insertSubview(view, at: 0)
            view.topAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
        
        datePicker.minimumDate = Date()
        
        return datePicker
    }()
    
    public let initialDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = Asset.red500.color
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        datePicker.subviews.first?.subviews.forEach { grayView in
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = Asset.gray50.color
            grayView.insertSubview(view, at: 0)
            view.topAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: grayView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        }
    
        datePicker.minimumDate = Date()

        
        return datePicker
    }()
    
    private let finalDateTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 17, color: Asset.gray950.color, weight: .regular)
        label.text = L10n.Constants.Content.Label.NewActivity.CreateEvent.finalDateTitle
        label.addLineHeight(of: 24)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.gray50.color
        
        return view
    }()
    
    private let bar: UIView = {
        let bar = UIView()
        bar.backgroundColor = Asset.gray100.color
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(backgroundView)
        
        addArrangedSubview(initialPickerStack)
        initialPickerStack.addArrangedSubview(initialDateTitle)
        initialPickerStack.addArrangedSubview(initialDatePicker)
        
        addArrangedSubview(bar)
        
        addArrangedSubview(finalPickerStack)
        finalPickerStack.addArrangedSubview(finalDateTitle)
        finalPickerStack.addArrangedSubview(finalDatePicker)
        
        
    }
    
    func addConstraints() {
        initialPickerStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        initialDateTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(2.su)
            $0.width.equalTo(8.su)
        }
        
        initialDatePicker.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-2.su)
        }
        
        bar.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(2.su)
            $0.height.equalTo(1)
        }
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        finalDateTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(2.su)
            $0.width.equalTo(8.su)
        }
        
        finalDatePicker.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-1.su)
        }
        
        finalPickerStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
    }
    
    func addAdditionalConfiguration() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fill
        initialPickerStack.layer.cornerRadius = 1.su
        finalPickerStack.layer.cornerRadius = 1.su
        backgroundView.layer.cornerRadius = 1.su
    }
    
}

