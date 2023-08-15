//
//  lunaUITests.swift
//  lunaUITests
//
//  Created by alexdamascena on 17/07/23.
//

import XCTest
@testable import luna

final class lunaUITests: XCTestCase {
    
    private let app = XCUIApplication()
    
    func testOnboardingAppWithNoPermissionToCalendar() throws {
        app.launchArguments += ["UI-Testing"]
        app.resetAuthorizationStatus(for: .calendar)
        app.launch()
        
        let buttonInit = app.buttons[L10n.Constants.Content.Button.start]
        XCTAssertTrue(buttonInit.exists, "Iniciar label button not found")
        buttonInit.tap()
        
        let daySelectedDatePicker = app.scrollViews.otherElements.datePickers.collectionViews.staticTexts["3"]
        XCTAssertTrue(daySelectedDatePicker.exists, "Day 3 of DatePicker not found")
        daySelectedDatePicker.tap()
        
        let buttonContinue = app.buttons[L10n.Constants.Content.Button.continue]
        XCTAssertTrue(buttonContinue.exists, "Continuar label button not found")
        buttonContinue.tap()
        
        let pickerDayMenstruation = app.scrollViews.otherElements.pickerWheels
        pickerDayMenstruation["5"].adjust(toPickerWheelValue: "2")
        pickerDayMenstruation["2"].tap()
        
        buttonContinue.tap()
        
        let buttonBack = app.buttons[L10n.Constants.Content.Button.previous]
        XCTAssertTrue(buttonBack.exists, "Voltar label button not found")
        buttonBack.tap()
        
        buttonContinue.tap()
        
        let pickerTimeCycle = app.scrollViews.otherElements.pickerWheels
        pickerTimeCycle["28"].adjust(toPickerWheelValue: "10")
        XCTAssertTrue(pickerTimeCycle["10"].exists, "Picker Time Menstruation Cycle 10 days not found")
        pickerTimeCycle["10"].tap()
    
        buttonContinue.tap()
        buttonContinue.tap()
        buttonBack.tap()
        buttonContinue.tap()
        buttonContinue.tap()
        
        let locationDialogMonitor = addUIInterruptionMonitor(withDescription: "“luna” Deseja Ter Acesso ao Seu Calendário") { (alertElement) in
            let partialPermissionMessage = "Deseja Ter Acesso ao Seu Calendário"
            guard alertElement.label.contains(partialPermissionMessage) else { return false }
            alertElement.buttons["Não Permitir"].tap()
            return true
        }
        
        buttonContinue.tap()
        
        let homeViewWithPermissionToCalendar = app.staticTexts["Aprenda sobre as"]
        XCTAssertTrue(homeViewWithPermissionToCalendar.exists)
    }

    func testOnboardingAppWithPermissionToCalendar() throws {
        app.launchArguments += ["UI-Testing"]
        app.resetAuthorizationStatus(for: .calendar)
        app.launch()
        
        let buttonInit = app.buttons["Iniciar"]
        XCTAssertTrue(buttonInit.exists, "Iniciar label button not found")
        buttonInit.tap()
        
        let daySelectedDatePicker = app.scrollViews.otherElements.datePickers.collectionViews.staticTexts["8"]
        XCTAssertTrue(daySelectedDatePicker.exists, "Day 8 of DatePicker not found")
        daySelectedDatePicker.tap()
        
        let buttonContinue = app.buttons["Continuar"]
        XCTAssertTrue(buttonContinue.exists, "Continuar label button not found")
        buttonContinue.tap()
        
        let pickerDayMenstruation = app.scrollViews.otherElements.pickerWheels
        pickerDayMenstruation["5"].adjust(toPickerWheelValue: "14")
        pickerDayMenstruation["14"].tap()
        
        buttonContinue.tap()
        
        let buttonBack = app.buttons["Voltar"]
        XCTAssertTrue(buttonBack.exists, "Voltar label button not found")
        buttonBack.tap()
        
        buttonContinue.tap()
        
        let pickerTimeCycle = app.scrollViews.otherElements.pickerWheels
        XCTAssertTrue(pickerTimeCycle["28"].exists, "Picker Time Menstruation Cycle 28 days not found")
        pickerTimeCycle["28"].tap()
    
        buttonContinue.tap()
        buttonContinue.tap()
        buttonBack.tap()
        buttonContinue.tap()
        buttonContinue.tap()
        
        let locationDialogMonitor = addUIInterruptionMonitor(withDescription: "“luna” Deseja Ter Acesso ao Seu Calendário") { (alertElement) in
            let partialPermissionMessage = "Deseja Ter Acesso ao Seu Calendário"
            guard alertElement.label.contains(partialPermissionMessage) else { return false }
            alertElement.buttons["OK"].tap()
            return true
        }
        
        buttonContinue.tap()
        
        let homeViewWithPermissionToCalendar = app.staticTexts[L10n.Constants.Content.Label.Home.youAreIn]
        XCTAssertTrue(homeViewWithPermissionToCalendar.exists)
    }
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

// 
