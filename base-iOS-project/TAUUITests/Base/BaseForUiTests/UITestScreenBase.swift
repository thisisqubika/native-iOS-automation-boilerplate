//
//  UITestScreenBase.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import Foundation
import XCTest

class UITestScreenBase {
    var app: XCUIApplication
    var testCase: XCTestCase
    
    init(app: XCUIApplication, testCase: XCTestCase) {
        self.app = app
        self.testCase = testCase
    }
}
