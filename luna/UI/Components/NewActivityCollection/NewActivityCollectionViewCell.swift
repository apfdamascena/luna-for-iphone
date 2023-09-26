//
//  NewActivityCollectionViewCell.swift
//  luna
//
//  Created by Cynara Costa on 19/09/23.
//

import UIKit
import SnapKit

class NewActivityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewActivityCollectionViewCell"

    private(set) var numberLabel: LunaText = {
        let label = LunaText()
        let model = LunaTextViewModel(size: 17, color: Asset.gray950.color, weight: .regular)
        label.addLineHeight(of: 24)
        label.text = "1"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.draw(model)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = Asset.gray200.color.cgColor
        contentView.layer.cornerRadius = 1.su
        
        contentView.addSubview(numberLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        numberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    public func configure(label: String) {
        numberLabel.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        numberLabel.text = nil
    }
    
}
