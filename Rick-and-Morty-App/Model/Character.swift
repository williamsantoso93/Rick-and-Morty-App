//
//  Character.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 11/04/23.
//

import Foundation

protocol BaseModel {
    var id: Int { get set }
}

struct Character: Codable, BaseModel {
    var id: Int
    var name: String
    var status: Status
    var species, type: String
    var gender: Gender
    var origin, location: CharacterLocation
    var image: String
    var episode: [String]
    var url: String
    var created: String?
}

enum Gender: String, Codable, CaseIterable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
    
    static func allCasesRawValue() -> [String] {
        self.allCases.map { item in
            item.rawValue.capitalized
        }
    }
}

enum Status: String, Codable, CaseIterable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    static func allCasesRawValue() -> [String] {
        self.allCases.map { item in
            item.rawValue.capitalized
        }
    }
}

struct CharacterLocation: Codable {
    var name: String
    var url: String
}
