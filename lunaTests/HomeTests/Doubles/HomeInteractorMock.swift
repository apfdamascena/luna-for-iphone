//
//  HomeInteractorMock.swift
//  lunaTests
//
//  Created by alexdamascena on 01/09/23.
//

@testable import luna
import UIKit


class HomeInteractorMock: PresenterToInteractorHomeProtocol {
    
    var presenter: luna.InteractorToPresenterHomeProtocol?
    
    func checkIfUserGivePermission(completion: @escaping luna.PermissionResponse) {
        
    }
    
    func loadPhasesToUserCalendar() {
        
    }
    
    func loadCalendarToCollection() -> [luna.CyclePhaseViewModel] {
        return []
    }
    
    func insertedMenstruationToCollection(selectedDate: Date) -> Bool {
        return false
        
    }
    
    func openDeviceSettings() {
        
    }
    
    func nextIndexForCardPhase(at index: Int) -> Int {
        return (index + 1) % 5
    }
}
