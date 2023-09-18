//
//  ActivityView.swift
//  luna
//
//  Created by alexdamascena on 14/09/23.
//

import UIKit
import SnapKit

class ActivitiesView: UIView, AnyView {
    
    private let activitiesTitleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    private let activitiesTitle: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 25,
                                      color: .black,
                                      weight: .semibold)
        label.draw(model)
        label.text="Atividades"
        return label
    }()
    
    private(set) var newActivity: LunaButton = {
        let button = LunaButton()
        button.draw(style: .newEvent)
        return button
    }()
    
    private(set) var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Semana", "Mês"])
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    private let activitiesStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1.5.su
        stack.axis = .vertical
        stack.alignment = .fill
        return stack
    }()
    
    private(set) var activities: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 24*2, height: 80)
        layout.minimumLineSpacing = 12
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.backgroundColor = .blue
        
        collection.register(ActivityCell.self, forCellWithReuseIdentifier: ActivityCell.IDENTIFIER)
        
        collection.isScrollEnabled = false
        
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        addSubview(activitiesTitleStack)
        activitiesTitleStack.addArrangedSubview(activitiesTitle)
        activitiesTitleStack.addArrangedSubview(newActivity)
        
        addSubview(segmentedControl)
        addSubview(activities)
    
    }
    
    func addConstraints() {
        
        activitiesTitleStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(4.su)
        }
        
        segmentedControl.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(4.su)
            $0.top.equalTo(activitiesTitleStack.snp.bottom).offset(2.su)
        }
        
        activities.snp.makeConstraints{
            $0.top.equalTo(segmentedControl.snp.bottom).offset(2.su)
            $0.leading.trailing.equalToSuperview()
            
            $0.height.equalTo(60.su)
        }
    }
    
    func createTableWithActivities(_ activities: [ActivityCell]){
        
    }
}
