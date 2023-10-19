//
//  UITestBaseRepresentative.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import Foundation

class UITestBaseRepresentative: UITestBase {
    lazy var enrollFlow: EnrollFlow = .init(app: app, testCase: testCase)
}
