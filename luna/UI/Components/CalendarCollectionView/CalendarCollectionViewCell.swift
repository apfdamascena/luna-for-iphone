//
//  CalendarScrollCollectionViewCell.swift
//  luna
//
//  Created by gabrielfelipo on 25/07/23.
//

import UIKit
import SnapKit

class CalendarCollectionViewCell: UICollectionViewCell,
                                        AnyView,
                                        DrawableView {
    
    typealias ViewModel = CyclePhaseViewModel
    
    let daysOfTheWeek = ["D", "S", "T", "Q", "Q", "S", "S"]
    
    static let IDENTIFIER = "CalendarScrollCollectionViewCell"
    
    var day: Date?
    
    var phase: CyclePhase?
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .equalCentering
        return view
    }()
    
    private let weekendDay: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        
        label.layer.opacity = 0.5
        label.text = "Q"
        label.textAlignment = .center

        label.draw(model)
        return label
    }()

    private let menstruationStatusToggle = UIView()
    
    private let cellStatus: UIImageView = {
        let imageView = UIImageView(image: Asset.noneSelected.image)
        return imageView
    }()
    

    private let monthDay: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        label.layer.opacity = 0.5
        label.text = "10"
        label.textAlignment = .center

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
        addSubview(stack)
        stack.addArrangedSubview(weekendDay)
        stack.addArrangedSubview(menstruationStatusToggle)
        stack.addArrangedSubview(monthDay)
        addSubview(cellStatus)
    }
    
    func addConstraints() {
        menstruationStatusToggle.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(67)
            $0.width.equalTo(43)
        }
        
        stack.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(123)
            
        }
        
        monthDay.snp.makeConstraints{
            $0.bottom.equalToSuperview()
        }
        
        weekendDay.snp.makeConstraints{
            $0.top.equalToSuperview()
        }
        
        cellStatus.snp.makeConstraints{
            $0.edges.equalTo(menstruationStatusToggle)
        }
        
    }
    
    func addAdditionalConfiguration() {
        menstruationStatusToggle.backgroundColor = Asset.cinza100.color
    }
    
    func draw(_ model: CyclePhaseViewModel) {
        cellStatus.image = model.phase.image
        
        menstruationStatusToggle.layer.cornerRadius = 22
        
        cellStatus.layer.opacity = 0.4
        
        menstruationStatusToggle.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        cellStatus.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        monthDay.layer.opacity = isToday(date: model.day) ? 1 : 0.5
        
        weekendDay.layer.opacity = isToday(date: model.day) ? 1 : 0.5
        
        weekendDay.text = getDayOfTheWeek(date: model.day)
        
        monthDay.text = getDate(date: model.day)
        
        day = model.day
        
        phase = model.phase
        
        let model = isToday(date: model.day) ? LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                                                                                             weight: .bold) :
        LunaTextViewModel(size: 13,
                                      color: Asset.primaryGray900.color,
                                      weight: .regular)
        
        monthDay.draw(model)
        weekendDay.draw(model)
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.menstruationStatusToggle.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.cellStatus.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.cellStatus.layer.opacity = 1
            
        }
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
            self.menstruationStatusToggle.transform = CGAffineTransform.identity
            self.cellStatus.transform = CGAffineTransform.identity
            self.cellStatus.layer.opacity = 0.4
        }
    }
    
    func getDayOfTheWeek(date: Date) -> String {
            return daysOfTheWeek[Calendar.current.dateComponents([.weekday], from: date).weekday! - 1]
           
        }
    
    func isToday(date: Date) -> Bool {
        let today = Date.now
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let todayForm = dateFormatter.string(from: today)
        let dateForm = dateFormatter.string(from: date)
        
        if todayForm == dateForm {
            return true
        }
        else{
            return false
        }
    }
    
    func getDate() -> Date {
        return self.day ?? .now
    }
    
    func getPhase() -> CyclePhase {
        return self.phase ?? .none
    }
    
    func getDate(date: Date) -> String{
            let df = DateFormatter()
            df.dateStyle = DateFormatter.Style.medium
            df.timeStyle = DateFormatter.Style.medium
            let date = (df.string(from: date))

            return String(date.prefix(2))
        }
}
