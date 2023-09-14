//
//  BestActivityView.swift
//  luna
//
//  Created by sml on 12/09/23.
//

import UIKit
import SnapKit

class BestActivityView: UIView, AnyView {
    
    private let cycleImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private let subtitleCyclePhase: LunaText = {
            let label = LunaText()
            let model = LunaTextViewModel(size: 25,
                                          color: .black,
                                          weight: .regular)
            label.text = L10n.Constants.Content.Label.BestActivity.subtitle
            label.draw(model)
            label.numberOfLines = 0
            label.addLineHeight(of: 31)
            return label
        }()
    
    private let cyclePhase: LunaText = {
            let label = LunaText()
            let model = LunaTextViewModel(size: 28,
                                          color: .black,
                                          weight: .medium)
            label.draw(model)
            label.addLineHeight(of: 34)
            return label
        }()
    
    private let bestMomentText: LunaText = {
            let label = LunaText()
            let model = LunaTextViewModel(size: 17,
                                          color: .black,
                                          weight: .regular)
            label.draw(model)
            label.numberOfLines = 0
            label.addLineHeight(of: 24)
            return label
        }()
    
    private let bestMomentContainer: UIView = UIView()

    var button: LunaButton = {
        let button = LunaButton()
        button.draw(style: .scheduleActivity)
        return button
    }()
    
    private let stackTest: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {

        addSubview(cycleImage)
        addSubview(stackTest)

        stackTest.addArrangedSubview(subtitleCyclePhase)
        stackTest.addArrangedSubview(cyclePhase)
        stackTest.addArrangedSubview(bestMomentContainer)
        bestMomentContainer.addSubview(bestMomentText)

        addSubview(button)

    }
    
    func addConstraints() {
        cycleImage.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalTo(safeAreaLayoutGuide).offset(3.su)
        }
        
        stackTest.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.top.equalTo(cycleImage.snp.bottom).offset(4.su)
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }

        bestMomentText.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(2.su)
        }

        button.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(3.su)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-9.su)
        }
    }
    
    func draw(_ viewModel: BestActivityViewModel) {
        cycleImage.image = viewModel.cycleImage
        bestMomentText.attributedText = bestMomentText.attributedTextBold(
            withString: "\(L10n.Constants.Content.Label.BestActivity.text) \(adjustDateFormat(viewModel.dates)).",
            boldString: "\(adjustDateFormat(viewModel.dates)).",
            model: LunaTextViewModel(size: 17, color: .black, weight: .regular)
        )
        
        cyclePhase.text = viewModel.phaseTitle
    }
    
    func adjustDateFormat(_ dateInterval: DateInterval) -> String {
        let startDate = dateInterval.start
        let endDate = dateInterval.end

        if startDate.formatMonthToString() == endDate.formatMonthToString() {
            return "\(startDate.formatDayToString()) \(L10n.Constants.Preposition.and) \(endDate.formatDayToString()) \(L10n.Constants.Preposition.of) \(startDate.formatMonthToString())"
        }
        
        return "\(startDate.formatDayToString()) \(L10n.Constants.Preposition.of) \(startDate.formatMonthToString()) \(L10n.Constants.Preposition.and) \(endDate.formatDayToString()) \(L10n.Constants.Preposition.of) \(endDate.formatMonthToString())"

    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
    }
    
}
