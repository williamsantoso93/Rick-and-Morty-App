//
//  BaseResponse.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 10/04/23.
//

import Foundation

struct BaseList<T: Codable>: Codable {
    var info: Info?
    var results: [T]
}

struct Info: Codable {
    var count, pages: Int
    var next: String?
    var prev: String?
}

//TODO: remove unused var
struct Character: Codable {
    var id: Int
    var name: String
    var status: Status
    var species: Species
    var type: String
    var gender: Gender
    var origin, location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    var id: Int?
    var name, type, dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// MARK: - Episode
struct Episode: Codable {
    var id: Int
    var name, airDate, episode: String
    var characters: [String]
    var url: String
    var created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
