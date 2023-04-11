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
