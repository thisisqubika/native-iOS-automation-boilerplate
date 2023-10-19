//
//  UITestBase.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import Foundation
import XCTest

class UITestBase: XCTestCase {
    let app: XCUIApplication = .init()
    let testCase: XCTestCase = .init()
    
    // MARK: setUp/tearDown for test cases
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
        
    // MARK: setUp/tearDown for test suits
    override class func tearDown() {}
}
