//
//  EnrollFlow.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import Foundation
import XCTest

class EnrollFlow: UITestScreenRepresentative {
    // Static texts
    lazy var welcomeMessage: XCUIElement = app.staticTexts[EFid.welcomeMessage.rawValue]
    lazy var enterCity: XCUIElement = app.staticTexts[EFid.enterCity.rawValue]
    lazy var enterCityErrorMessage: XCUIElement = app.staticTexts[EFid.enterCityMessage.rawValue]
    lazy var enterCitySuccessfulMessage: XCUIElement = app.staticTexts[EFid.successfulEnrollMessage.rawValue]
    
    // Buttons
    lazy var enrollButton: XCUIElement = app.buttons[EFid.enrollButton.rawValue]
    
    // Images
    lazy var TAULogo: XCUIElement = app.images[EFid.TAUlogo.rawValue]
    
    // Text Fields
    lazy var cityField: XCUIElement = app.textFields[EFid.city.rawValue]
    
    // MARK: THEN
    func thenAllElementsAppear() {
        welcomeMessage.assertExistence()
        enterCity.assertExistence(isElementStatic: true)
        enrollButton.assertExistence(isElementStatic: true)
        TAULogo.assertExistence(isElementStatic: true)
        cityField.assertExistence(isElementStatic: true)
    }
    
    func thenErrorMessageAppears() {
        XCTAssertTrue(enterCityErrorMessage.isVisible())
    }
    
    func thenSuccessfulMessageAppears() {
        XCTAssertTrue(enterCitySuccessfulMessage.isVisible())
    }
    
    // MARK: WHEN
    func whenCityIsTyped(city: String) {
        cityField.clearAndInputText(text: city, closeKeyboard: false)
        app.keyboards.buttons["return"].tap()
    }
    
    func whenTapEnrollButton() {
        enrollButton.tap()
    }
}
