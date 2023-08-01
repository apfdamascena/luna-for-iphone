//
//  HomeView.swift
//  luna
//
//  Created by Cynara Costa on 28/07/23.
//

import UIKit
import SnapKit

class HomeView: UIView, AnyView  {
    
    private let calendarSyncView = CalendarSyncCard()
    private let informationalPhaseTextView = InformationalPhaseText()
    private let recordedMenstruationCardView = RecordedMenstruationCard()
    
    
    private(set) var  calendarCollectionView: UICollectionView = {
        let layout = CalendarCollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.backgroundColor = .white
        collection.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.IDENTIFIER)
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private let contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        return view
    }()

    private let placeHolder: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 48, color: .black, weight: .bold)
        label.text = "PLACEHOLDER"
        label.textAlignment = .center
        label.draw(model)
        return label
    }()
    
    private let youAreInLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.youAreIn
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let phaseTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 40, color: .black, weight: .semibold)
        label.text = L10n.Constants.Content.Label.Home.menstruation
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let learnCycleTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .regular)
        label.text = L10n.Constants.Content.Label.Home.learnCycle
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let cyclePhasesTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25, color: .black, weight: .medium)
        label.text = L10n.Constants.Content.Label.Home.cyclePhases
        label.numberOfLines = 0
        label.textAlignment = .left
        label.draw(model)
        return label
    }()
    
    private let stackPhaseLearn: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 0
        return view
    }()
    
    private let stackPhaseCycle: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 0
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
        
//        stackPhaseCycle.addArrangedSubview(youAreInLabel)
//        stackPhaseCycle.addArrangedSubview(phaseTitle)
//        stackPhaseLearn.addArrangedSubview(learnCycleTitle)
//        stackPhaseLearn.addArrangedSubview(cyclePhasesTitle)
        addSubview(calendarCollectionView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
//
//        contentView.addSubview(placeHolder)
//        contentView.addSubview(stackPhaseCycle)
//
//        contentView.addSubview(calendarSyncView)
//        contentView.addSubview(stackPhaseLearn)
//        contentView.addSubview(informationalPhaseTextView)
////        contentView.addSubview(recordedMenstruationCardView)
        
    }
    
    func addConstraints() {
//        print(UIScreen.current?.bounds.width)
        
        calendarCollectionView.snp.makeConstraints{
            $0.height.equalTo(123)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide)
        }
//
//
        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(3.su)
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.top.equalTo(calendarCollectionView.snp.bottom)
        }
//
//        contentView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.width.equalTo(scrollView)
//        }
        
        
//
//        placeHolder.snp.makeConstraints {
//            $0.top.equalTo(contentView).offset(15.su)
//            $0.leading.trailing.equalTo(contentView).inset(3.su)
//        }
//
//        stackPhaseCycle.snp.makeConstraints {
//            $0.top.equalTo(placeHolder.snp.bottom).offset(5.su)
//            $0.leading.trailing.equalTo(contentView).inset(3.su)
//        }
//
//        calendarSyncView.snp.makeConstraints {
//            $0.top.equalTo(stackPhaseCycle.snp.bottom).offset(5.su)
//            $0.leading.trailing.equalTo(contentView).inset(3.su)
//        }
//
//        stackPhaseLearn.snp.makeConstraints {
//            $0.top.equalTo(calendarSyncView.snp.bottom).offset(4.su)
//            $0.leading.trailing.equalTo(contentView).inset(3.su)
//        }
//
//        informationalPhaseTextView.snp.makeConstraints {
//            $0.top.equalTo(stackPhaseLearn.snp.bottom).offset(5.su)
//            $0.leading.trailing.equalTo(contentView).inset(3.su)
//        }
//
////        recordedMenstruationCardView.snp.makeConstraints {
////            $0.top.equalTo(informationalPhaseTextView.snp.bottom).offset(53)
////            $0.leading.trailing.equalTo(contentView).inset(3.su)
////            $0.bottom.equalTo(contentView)
////        }
////
//        contentView.backgroundColor = .yellow
//        scrollView.backgroundColor = .green
//        informationalPhaseTextView.backgroundColor = .purple
//
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .white
        scrollView.backgroundColor = .yellow
        contentView.backgroundColor = .blue
    }
    
}

