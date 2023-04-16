//
//  BaseResponse.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 10/04/23.
//

import Foundation

/// A struct representing the base response structure of lists.
///
/// This struct includes metadata about the list, such as the total count of items, the number of pages, and URLs for
/// navigating to the next and previous pages of the list. It also includes an array of results of generic type T, which
/// represents the items in the list.
///
/// - Parameter T: The type of items in the list.
struct BaseList<T: Codable>: Codable {
    var info: Info?
    var results: [T]
}

/// A struct representing the metadata of a list.
///
/// This struct includes information such as the total count of items in the list, the number of pages, and URLs for
/// navigating to the next and previous pages of the list.
struct Info: Codable {
    var count, pages: Int
    var next: String?
    var prev: String?
}
