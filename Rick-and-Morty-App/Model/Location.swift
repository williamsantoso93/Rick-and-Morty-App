//
//  Location.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 11/04/23.
//

import Foundation

struct Location: Codable {
    var id: Int
    var name: String
    var type, dimension: String
    var residents: [String]
    var url: String
    var created: String
}
