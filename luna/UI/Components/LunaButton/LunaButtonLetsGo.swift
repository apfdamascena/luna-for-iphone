import UIKit

class LunaButtonLetsGo: DrawableButton {
    
    let button: UIButton
    
    init(_ button: UIButton) {
        self.button = button
    }
    
    func draw() {
        
        var configuration = UIButton.Configuration.plain()
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        container.foregroundColor = Asset.red600.color
        
        configuration.attributedTitle = AttributedString(L10n.Constants.Content.Label.FirstTimeNewActivity.button, attributes: container)
        configuration.baseForegroundColor = Asset.red600.color
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: (1.75).su, leading: (2.5).su, bottom: (1.75).su, trailing: (2.5).su)
        
        configuration.background.backgroundColor = .white
        
        self.button.configuration = configuration
    }
    
    func addAdditionalConfiguration() {
        self.button.layer.cornerRadius = 1.su
        self.button.clipsToBounds = true
    }
    
}
