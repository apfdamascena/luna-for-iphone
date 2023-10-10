@testable import luna
import EventKit
import UIKit

class NewActivityInteractorSpy: NewActivityInteractor {
    enum Methods: Equatable {
        case findBestActivity
    }
    
    private(set) var calledMethods = [Methods]()
    
    override func findBestPhaseFor(activity: ActivityMetrics) -> EKEvent? {
        calledMethods.append(.findBestActivity)
        let store = EKEventStore()
        return EKEvent(eventStore: store)
    }
    
}
