//
//  Episode.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 11/04/23.
//

import Foundation

struct Episode: Codable, BaseModel {
    var id: Int
    var name: String
    var airDate, episode: String
    var characters: [String]
    var url: String
    var created: String
    var createdFormatted: String {
        created.toDate(formatString: "HH:mm, MMMM YYYY")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
