@testable import luna
import UIKit

class NewActivityViewControllerSpy: NewActivityViewController {
    enum Methods: Equatable {
        case showFeedback
    }
    
    private(set) var calledMethods = [Methods]()
    
    override func showFeedbackForUser(with text: String) {
        calledMethods.append(.showFeedback)
    }
    
}
