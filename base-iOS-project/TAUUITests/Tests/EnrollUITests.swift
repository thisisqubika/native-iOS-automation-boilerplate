//
//  EnrollUITests.swift
//  TAUUITests
//
//  Created by Shashikant Jagtap on 10/02/2019.
//  Copyright © 2019 Shashikant Jagtap. All rights reserved.
//

import XCTest

class EnrollUITests: UITestBaseRepresentative {
    
    func testAllElementsOfMainScreen() {
        enrollFlow.thenAllElementsAppear()
        enrollFlow.whenTapEnrollButton()
        enrollFlow.thenErrorMessageAppears()
    }
    
    func testThankYouMessage() {
        enrollFlow.whenCityIsTyped(city: "Montevideo")
        enrollFlow.whenTapEnrollButton()
        enrollFlow.thenSuccessfulMessageAppears()
    }
}
