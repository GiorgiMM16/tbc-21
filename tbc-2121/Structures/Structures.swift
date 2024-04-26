//
//  Structures.swift
//  tbc-2121
//
//  Created by Giorgi Michitashvili on 4/25/24.
//

import Foundation


struct List: Codable {
    var list: [Country]

    struct Country: Codable {
        var name: String
        var png: String
    }

    var countryNames: [String] {
        return list.map { $0.name }
    }
}


enum CountriesError: Error {
    case UrlError
    case invalidResponse
    case invalidData
}


