//
//  Users.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import Foundation

/**
 Generate random `new Test User`
 - Parameters:
    - text: pass any text you need. By default `"test+"`
    - characters: pass number of characters before `@`. By default `8`
    - domain: select from `DomainTypes` list type. By default `.test`
  - Returns: generated random `new Test User`
 */
func createNewTestUser(text: String = "test+", characters: Int = 8, domain: Random.DomainTypes = .test) -> TestUser {
    return .init(firstName: "Test",
                 lastName: "Test",
                 username: Random.email(text: text,
                                        characters: characters,
                                        domain: domain))
}

// MARK: - Test Users
let invalidUser: TestUser = .init(firstName: " ",
                                  lastName: " ",
                                  username: "invalid@email.",
                                  password: "test")

let user2276: TestUser = .init(firstName: "Test",
                               lastName: "Test",
                               username: "sijihujennei-2276@yopmail.com")
