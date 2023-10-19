//
//  Element.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//


import Foundation
import XCTest

public extension XCUIElement {
    /**
     List of the directions
     */
    enum Directions: String {
        case up, down, left, right
    }
    
    // MARK: - Assertions
    /**
     Asserts element exists
     - Parameters:
       - timeout: pass how many seconds needs to wait. By default `TimeInterval = 5.0 sec`
       - isElementStatic: pass true if element should exist right on method call. By default `isElementStatic = false`
     */
    func assertExistence(timeout: TimeInterval = 5.0, isElementStatic: Bool = false) {
        if isElementStatic {
            XCTAssertTrue(self.exists, "The element - \(self) is not exists")
        } else {
            XCTAssertTrue(self.waitForExistence(timeout: timeout), "\(self) did not exist after \(timeout) seconds")
        }
    }
    
    /**
     Asserts element doesn't exists
     - Parameters:
       - timeout: pass how many seconds needs to wait. By default `TimeInterval = 5.0 sec`
       - isElementStatic: pass true if element should exist right on method call. By default `isElementStatic = false`
     */
    func assertNotExistence(timeout: TimeInterval = 5.0, isElementStatic: Bool = false) {
        if isElementStatic {
            XCTAssertFalse(self.exists)
        } else {
            XCTAssertFalse(self.waitForExistence(timeout: timeout), "\(self) did not exist after \(timeout) seconds")
        }
    }
    
    /**
     - Parameters:
        - length: pass expected length
     */
    func assertLengthEqual(to length: Int) {
        if let value = (self.value as? String)?.count {
            XCTAssertEqual(value, length, "Characters in length - \(value), but expected - \(length)")
        }
    }
    
    /**
     Asserts button `selected` property
     - Parameters:
        - isSelected: Boolean to verify if element should be selected
     */
    func assertButtonSelected(isSelected: Bool) {
        if isSelected {
            XCTAssertTrue(self.isSelected)
        } else {
            XCTAssertFalse(self.isSelected)
        }
    }
    
    /**
     Asserts value equals to expected
     - Parameters:
       - text: pass expected text as string
     */
    func assertValueEqual(to text: String) {
        let valueString = self.value as? String ?? "no value at all"
        XCTAssertTrue(valueString == text, "Indicator displays wrong value, which is \(valueString)")
    }
    
    /**
     Asserts that label of the element is not empty
     */
    func assertLabelIsNotEmpty() {
        XCTAssertFalse(self.label.isEmpty, "Element \(self) is empty")
    }

    /**
     Asserts label equals to expected text
     - Parameters:
       - text: pass expected text as string
     */
    func assertLabelEquals(to text: String) {
        assertLabelIsNotEmpty()
        XCTAssertTrue(self.label.contains(text), "Label \(self.label) does not equal to \(text)")
    }
    
    /**
     Asserts that  the element is `hittable`
     */
    func assertHittable() {
        XCTAssertTrue(self.isHittable, "The element is not hittable" )
    }
    
    /**
     Asserts that the element is `not hittable`
     */
    func assertNotHittable() {
        XCTAssertFalse(self.isHittable, "The element is hittable")
    }
    
    /**
     - Parameters:
        - enabled (Optional):
            - default: Asserts that the element is enabled
            - false: Asserts that the element is not enabled
     */
    func assertEnabled(_ enabled: Bool = true) {
        if enabled {
            XCTAssertTrue(self.isEnabled, "The element is not enabled")
        } else {
            XCTAssertFalse(self.isEnabled, "The element is enabled")
        }
    }
    
    /**
     Assert self visibility
      - Parameters:
        - isVisible(optional): pass `true` for visible and `false` for should not be visible
     */
    func assertVisibility(_ isVisible: Bool = true) {
        if isVisible {
            XCTAssertTrue(self.isVisible(), "The element is not visible")
        } else {
            XCTAssertFalse(self.isVisible(), "The element is visible")
        }
    }
    
    // MARK: - Interactions
    /**
     Make self visible by swiping in specific direction
      - Parameters:
       - direction: select desired direction from `Directions` list
     */
    func makeVisibleBySwiping(direction: Directions) {
        var attempts: Int = 5
        XCTContext.runActivity(named: "Assert brain introduction card elements") { _ in
            while attempts > 0 && (!self.isVisible() || !self.isHittable) {
                attempts -= 1
                XCUIApplication().swipeTo(direction: direction)
            }
        }

        if attempts == 0 {
            XCTFail("Test swiped down but can't find a visible and hittable element")
        }
    }

    /**
     Set self to desired state
      - Parameters:
        - enabled: Boolean, pass true to `enabled` and false to `disabled`
     */
    func setSateTo(enabled: Bool) {
        if isEnabled() != enabled { tap() }
    }
    
    /// - Returns: Boolean, true if `enabled` and false if `disabled`
    func isEnabled() -> Bool {
        self.value as? String == "1"
    }
    
    /**
     Taps on the element after asserting existence.
     - Parameters:
        - timeout: pass how many seconds needs to wait. By default `TimeInterval = 5.0 sec`
     
     */
    func tap(timeout: TimeInterval = 5.0) {
        self.assertExistence(timeout: timeout)
        self.tap()
    }
    
    /**
     Taps on a block element via coordinates.
     If element is not hittable function will tap on the element via coordinates
     */
    func forceTap() {
        if self.isHittable {
            self.tap()
        }
        let coordinates: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector.zero)
        coordinates.tap()
    }
    
    /**
     Sets picker value to specified new value
     - Parameters:
        - value: value to set the picker
     */
    func setPickerValue(_ value: String) {
        XCTContext.runActivity(named: "Set piker to value - \(value)") { _ in
            self.adjust(toPickerWheelValue: value)
        }
    }
    
    /**
     Swipe to desired direction
      - Parameters:
        - direction: Select direction form `Directions` enum
        - numberOfSwipe: Pass desired number of swipes as integer
     */
    func swipeTo(direction: Directions, numberOfSwipes: Int = 1) {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = 0.25
        let pressDuration: TimeInterval = 0.05
        let center: CGFloat = 0.9
        
        let revertCenter = center * -1
        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment
        
        let leftStart = self.coordinate(withNormalizedOffset: .init(dx: center, dy: half))
        let leftEnd = self.coordinate(withNormalizedOffset: .init(dx: lessThanHalf, dy: half))
        
        let rightStart = self.coordinate(withNormalizedOffset: .init(dx: revertCenter, dy: half))
        let rightEnd = self.coordinate(withNormalizedOffset: .init(dx: moreThanHalf, dy: half))
        
        for _ in 1...numberOfSwipes {
            switch direction {
            case .up:
                XCUIApplication().swipeUp()
                break
            case .down:
                XCUIApplication().swipeDown()
                break
            case .left:
                leftStart.press(forDuration: pressDuration, thenDragTo: leftEnd)
                break
            case .right:
                rightStart.press(forDuration: pressDuration, thenDragTo: rightEnd)
                break
            }
        }
    }
    
    /**
     This function allows you to swipe down on a view to close it using XCUITest. It uses the `coordinate(withNormalizedOffset:)` method to get the coordinates of the element, specifying the start and end points of the swipe gesture. The `press(forDuration:thenDragTo:)` method is used to perform the swipe gesture from the start point to the end point.
     */
    func swipeDownToClose() {
        let start: XCUICoordinate = coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
        let finish: XCUICoordinate = coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 1.0))
        start.press(forDuration: 0, thenDragTo: finish)
    }
    
    /**
     - Parameters:
       - text: pass the text to be typed on the element
       - forceClear: waits for the Select All button to clear the field content. Defaults to `false`
       - closeKeyboard: close keyboard with tap on `Done` button, Defaults to `true`
     */
    func clearAndInputText(text: String,
                           forceClear: Bool = false,
                           closeKeyboard: Bool = true) {
        clearTextField(forceClear: forceClear)
        self.typeText(text)
        if closeKeyboard {
            let doneButton: XCUIElement = XCUIApplication().buttons["Done"]
            doneButton.tap()
        }
    }
    
    /**
     Clears the content of the field
      - Parameters:
        - forceClear: Boolean, pass `true` to enabled `forceClear`
     */
    func clearTextField(forceClear: Bool) {
        self.press(forDuration: 2.5)
        lazy var selectAllButton: XCUIElement = XCUIApplication().menuItems["Select All"]
        if forceClear {
            selectAllButton.exists() ? selectAllButton.tap() : self.doubleTap()

            self.typeText(XCUIKeyboardKey.delete.rawValue)
        }
    }
    
    // MARK: - Helpers
    /**
     - Returns: Boolean elements exist or not, return `true` or `false`
     - Parameters:
       - timeout: pass how many seconds needs to wait. By default `TimeInterval = 5.0 sec`
     */
    func exists(timeout: TimeInterval = 5.0) -> Bool {
        waitForExistence(timeout: timeout)
    }
    
    /// - Returns: Integer value of amount of character elements in secure text field
    func getPasswordLength() -> Int {
        let characterCount: String = self.secureTextFields.element(boundBy: 0).value as! String
        return characterCount.count
    }
    
    /// - Returns: Boolean elements visible not in frame, return `true` or `false`
    func isVisible() -> Bool {
        guard !self.frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
}
