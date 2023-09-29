//
//  HomeContract.swift
//  luna
//
//  Created by alexdamascena on 27/07/23.
//  
//

import Foundation
import EventKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    
    func userAllowedAccessCalendar()
    func allowAccessCalendar()
    func userDeniedAccessCalendar()
    
    func changeSelectedCell(selectedCell: CalendarCollectionViewCell) 
    func moveCalendarCollection(toXAxis: CGFloat)
    func updateView(_ center: CalendarCollectionViewCell)
    
    func load(collectionDataSource: [CyclePhaseViewModel])
    func moveInitialCollection() 
    
    func moveTo(_ month: Date)
    func showFeedbackRegisterMenstruation()
    
    func didUpdateState(_ state: HomeViewState)
    
    func changeCurrentIndexCardPhase(at newIndex: Int)
    func loadActivity(dataSource: ActivityEventMonthWeek)

}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
    func checkCalendarPermission()
    func loadUserCalendar()
    func insertMenstruation(selectedDate: Date) -> Bool
    func findBestPhase(activity: ActivityMetrics) -> EKEvent

    func loadCalendarToCollection(isloading: Bool)
        
    func userSelect(_ cell: CalendarCollectionViewCell?,
                    center: CalendarCollectionViewCell?,
                    andMoveCenter: CGFloat?)
    
    func moveTo(_ centerCell: CalendarCollectionViewCell?)
    func moveTo(_ month: Date)
    func userOpenDeviceSettings()
    
    func showCyclePhaseReferencesSheet()
    
    func userTappedCardPhase(at index: Int)
    func loadActivitiesDataSource()
    func getFirstDayLastMenstruation() -> Date?
    
    
    func openCalendarOnLuna(withEvent: EKEvent)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    
    var lunaCalendarManager: CalendarManager? { get }
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    
    func checkIfUserGivePermission(completion: @escaping PermissionResponse)
    func loadPhasesToUserCalendar()
    func loadCalendarToCollection() -> (calendar: [CyclePhaseViewModel], haveAccess: Bool)
    func insertedMenstruationToCollection(selectedDate: Date) -> Bool
    func insertActivityToCalendar(title: String, initialDate: Date, finalDate: Date)
    func findBestPhaseFor(activity: ActivityMetrics) -> EKEvent?
    
    func openDeviceSettings()
    
    func nextIndexForCardPhase(at index: Int) -> Int
    
    var calendarPermission: CalendarAccess { get }
    
    func findActivityEventsOfCurrentMonth() -> ActivityEventMonthWeek
    
    func getFirstDayOfLastMenstruation() -> Date? 
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    
    func accessAllowed()
    func accessDenied()
    func showFeedbackRegisterMenstruation()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    func pushReferencesSheet(on view: PresenterToViewHomeProtocol)
}
