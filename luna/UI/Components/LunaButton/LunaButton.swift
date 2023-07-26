import UIKit

class LunaButton: UIButton, AnyView, DrawableView {

    typealias ViewModel = LunaButtonViewModel

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw(_ model: LunaButtonViewModel) {
        var configuration = UIButton.Configuration.plain()
        configuration.baseForegroundColor = .white
        
        if model.style == .primary {
            configuration = UIButton.Configuration.filled()
            configuration.background.backgroundColor = Asset.primaryRed900.color
        } else {
            configuration.baseForegroundColor = Asset.primaryRed900.color
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor(named: Asset.primaryRed900.name)?.cgColor
        }
    
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20)
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        configuration.attributedTitle = AttributedString(model.text, attributes: container)
        
        self.configuration = configuration
    }
    
    func addAdditionalConfiguration() {
        layer.cornerRadius = 8
    }
    
}
