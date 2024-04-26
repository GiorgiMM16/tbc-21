//
//  Structures.swift
//  tbc-2121
//
//  Created by Giorgi Michitashvili on 4/25/24.
//

import Foundation

struct Country: Codable {
    struct Name: Codable {
        var official: String
        var common: String
    }
    var name: Name
    var png: String
}




enum CountriesError: Error {
    case UrlError
    case invalidResponse
    case invalidData
}


