//
//  TestUser.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import Foundation

class TestUser {
    var firstName: String?
    var lastName: String?
    let email: String
    let password: String
    let gender: Gender?
    
    /**
     - Parameters:
        - firstName: is optional value, pass as String if needed
        - lastName: is optional value, pass as String if needed
        - birthday: is optional value, pass as String if needed
        - username: pass as String if needed
        - password: pass as String. Default values is `Prueba1!`
        - gender: pass as String, Default value is `Male`
        - weight: pass as String, Default value is `170 lbs`
        - height: pass as String, Default value is `4`
     */
    init(firstName: String? = nil,
         lastName: String? = nil,
         username: String,
         password: String = "Prueba1!",
         gender: Gender = .male) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = username
        self.password = password
        self.gender = gender
    }
    
    enum Gender: String {
        case male = "Male"
        case female = "Female"
    }
}
