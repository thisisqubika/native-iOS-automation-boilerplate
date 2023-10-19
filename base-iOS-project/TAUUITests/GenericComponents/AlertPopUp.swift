//
//  AlertPopUp.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import XCTest
import Foundation

/**
 `AlertPopUp` class represents an alert popup in a user interface.
 - Parameters:
    - alertTitle: An instance of XCUIElement that represents the `title` element within the alert popup.
    - alertDescription: An instance of XCUIElement that represents the `description` element within the alert popup.
    - alertButton: An instance of XCUIElement that represents the `button` element within the alert popup.
 */
class AlertPopUp {
    var app: XCUIApplication = .init()
    var alertTitle: XCUIElement
    var alertDescription: XCUIElement
    var alertButton: XCUIElement
    
    init(title: String, button: String) {
        alertTitle = app.staticTexts[title]
        alertButton = app.buttons[button]
        alertDescription = app.otherElements.containing(NSPredicate(format: "label CONTAINS[c] '\(title)'"))
            .children(matching: .staticText).element(boundBy: 1)
    }
    
    /// Asserts alert appear
    func assertExistence() {
        XCTContext.runActivity(named: "Assert that all elements in alert component exist") { _ in
            alertTitle.assertExistence()
            alertDescription.assertExistence(isElementStatic: true)
            alertButton.assertExistence(isElementStatic: true)
        }
    }
    
    /**
     Assert alert description message
     - parameters:
        - expectedMessage: pass as String, Expected text to be displayed as description
     */
    func assertAlertMessage(expectedMessage: String) {
        XCTContext.runActivity(named: "Assert that description in alert component matches \(expectedMessage)") { _ in
            alertDescription.assertLabelEquals(to: expectedMessage)
        }
    }
    
    /// Tap on main button to close alert
    func closeAlert() {
        alertButton.tap()
    }
}
