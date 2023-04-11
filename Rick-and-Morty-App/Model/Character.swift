//
//  Character.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 11/04/23.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var status: String?
    var species, type: String?
    var gender: String?
    var origin, location: CharacterLocation?
    var image: String?
    var episode: [String]?
    var url: String
    var created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

struct CharacterLocation: Codable {
    var name: String
    var url: String
}
