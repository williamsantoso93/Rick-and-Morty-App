//
//  Character.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 11/04/23.
//

import Foundation

/// A protocol representing the base model for objects.
///
/// This protocol includes a required `id` property, which represents the unique identifier of the object.
protocol BaseModel: Identifiable {
    var id: Int { get set }
}

/// A struct representing a character.
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
    var createdFormatted: String {
        guard let created = created else {
            return "-"
        }
        
        return created.toDate(formatString: "HH:mm, MMMM YYYY")
    }
}

/// An enum representing the possible gender values of a character in the Rick and Morty
enum Gender: String, Codable, CaseIterable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
    
    /// Returns an array of all the raw values of the enum cases, capitalized.
    static func allCasesRawValue() -> [String] {
        self.allCases.map { item in
            item.rawValue.capitalized
        }
    }
}

/// An enum representing the possible status values of a character.
enum Status: String, Codable, CaseIterable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    /// Returns an array of all the raw values of the enum cases, capitalized.
    static func allCasesRawValue() -> [String] {
        self.allCases.map { item in
            item.rawValue.capitalized
        }
    }
}

/// A struct representing the location of a character.
struct CharacterLocation: Codable {
    var name: String
    var url: String
}


/// A struct representing the filters that can be applied to filter characters.
struct CharacterFilter {
    var name: String?
    var status: Status?
    var species: String?
    var gender: Gender?
}
