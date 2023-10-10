@testable import luna
import UIKit

class NewActivityRouterSpy: NewActivityRouter {
    enum Methods: Equatable {
        case pushNewActivity
    }
    
    private(set) var calledMethods = [Methods]()
    
    override func pushNewActivity(on view: PresenterToViewNewActivityProtocol) {
        calledMethods.append(.pushNewActivity)
    }
    
}
