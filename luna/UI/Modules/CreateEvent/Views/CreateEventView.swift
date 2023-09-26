//
//  CreateEventView.swift
//  luna
//
//  Created by sml on 20/09/23.
//

import UIKit
import SnapKit

class CreateEventView: UIView, AnyView, UITextFieldDelegate {
    
    let datePickers = DatePickersStack()
    
    public let activityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: L10n.Constants.Content.Label.NewActivity.CreateEvent.placeholderEventTitle,
            attributes: [NSAttributedString.Key.foregroundColor: Asset.gray400.color])
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.cornerRadius = 1.su
        textField.setLeftPaddingPoints(2.su)
        textField.textColor = .black
        textField.backgroundColor = Asset.gray50.color
        
        return textField
    }()
    
    private let nameStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1.su
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        
        return stack
    }()
    
    private let dateStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1.su
        stack.axis = .vertical
        stack.alignment = .fill
        
        return stack
    }()
    
    private let pickersStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 3.su
        stack.axis = .vertical
        stack.alignment = .fill
        
        return stack
    }()
    
    private let allComponentsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4.su
        stack.axis = .vertical
        stack.alignment = .center
        
        return stack
    }()
    
    var createEventButton: LunaButton = {
        let button = LunaButton()
        button.draw(style: .scheduleActivity)
        return button
    }()
    
    private let nameLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.gray400.color,
                                      weight: .regular)
        label.text = L10n.Constants.Content.Label.NewActivity.CreateEvent.name
        label.draw(model)
        label.addLineHeight(of: 16)
        return label
    }()
    
    private let bar: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.gray100.color
        return view
    }()
    
    private let dateLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.gray400.color,
                                      weight: .regular)
        label.text = L10n.Constants.Content.Label.NewActivity.CreateEvent.date
        label.draw(model)
        label.addLineHeight(of: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activityTextField.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(allComponentsStack)
        allComponentsStack.addArrangedSubview(bar)
        allComponentsStack.addArrangedSubview(pickersStack)
        pickersStack.addArrangedSubview(nameStack)
        nameStack.addArrangedSubview(nameLabel)
        nameStack.addArrangedSubview(activityTextField)
        pickersStack.addArrangedSubview(dateStack)
        dateStack.addArrangedSubview(dateLabel)
        dateStack.addArrangedSubview(datePickers)
        allComponentsStack.addArrangedSubview(createEventButton)
       
    }
    
    func addConstraints() {
        allComponentsStack.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        bar.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        createEventButton.snp.makeConstraints {

            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        pickersStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(3.su)
        }
        
        nameStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        dateStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        datePickers.snp.makeConstraints {
            $0.height.equalTo(12.su)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(2.su)
        }
        
        activityTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(6.su)
        }
        
        
    }
    
    func addAdditionalConfiguration() {
        self.backgroundColor = .white
    }
    
    func draw(_ viewModel: CreateEventViewModel) {
        activityTextField.attributedPlaceholder = NSAttributedString(
            string: viewModel.eventName,
            attributes: [NSAttributedString.Key.foregroundColor: Asset.gray400.color])
        
        datePickers.initialDatePicker.date = viewModel.dateInterval.start
        datePickers.finalDatePicker.date = viewModel.dateInterval.end
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activityTextField.resignFirstResponder()
        return true
    }
    
}


