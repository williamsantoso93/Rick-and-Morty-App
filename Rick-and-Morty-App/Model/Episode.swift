//
//  Episode.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 11/04/23.
//

import Foundation

/// A struct representing an episode.
struct Episode: Codable, BaseModel {
    var id: Int
    var name: String
    var airDate, episodeSeason: String
    var season: String {
        if let seasonIndex = episodeSeason.firstIndex(of: "S"),
           let episodeIndex = episodeSeason.firstIndex(of: "E") {
            let season = episodeSeason[seasonIndex..<episodeIndex].dropFirst()
            return String(season).trimmingCharacters(in: CharacterSet(charactersIn: "0"))
        }
        return ""
    }
    
    var episode: String {
        if let episodeIndex = episodeSeason.firstIndex(of: "E") {
            let episode = episodeSeason[episodeIndex...].dropFirst()
            return String(episode).trimmingCharacters(in: CharacterSet(charactersIn: "0"))
        }
        return ""
    }
    var characters: [String]
    var url: String
    var created: String
    var createdFormatted: String {
        created.toDate(formatString: "HH:mm, MMMM YYYY")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episodeSeason = "episode"
        case characters, url, created
    }
}
