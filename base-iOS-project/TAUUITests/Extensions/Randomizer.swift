//
//  Randomizer.swift
//  TAUUITests
//
//  Created by Mauro Botti on 16/10/23.
//  Copyright © 2023 Shashikant Jagtap. All rights reserved.
//

import Foundation

public struct Random {
    /// Lists with domains
    enum DomainTypes: String {
        case gmail = "gmail.com"
        case test = "test.com"
        case supperTest = "suppertest.com"
    }
    
    /**
     Generate random email
     - Parameters:
        - text: pass any text you need. By default `"test+"`
        - characters: pass number of characters before `@`. By default `8`
        - domain: select from `DomainTypes` list type. By default `.test`
      - Returns: generated random email as String
     */
    static func email(text: String = "test+",
                      characters: Int = 8,
                      domain: DomainTypes = .test) -> String {
        text + number(characters) + "@\(domain.rawValue)"
    }
    
    /**
     Generate random number
      - Parameters:
        - characters: pass number of characters. By default `5`
     */
    static func number(_ characters: Int = 5) -> String {
        var number: String
        let random: String = String(Int.random(in: 0...999999999999999999))
        if characters > 18 {
            number = String(random.suffix(characters) + String(random.suffix(characters - 18)))
        } else {
            number = String(random.suffix(characters))
        }
        return number
    }
}
