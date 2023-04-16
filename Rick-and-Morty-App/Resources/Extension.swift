//
//  Extension.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 14/04/23.
//

import Foundation

/// An extension of String providing utility methods for converting to and from Date.
extension String {
    /// Converts a string to a Date object using a specified date format.
    ///
    /// - Parameter format: The date format to use for parsing the string. Default value is "yyyy-MM-dd'T'HH:mm:ss.SSSZ".
    /// - Returns: A Date object parsed from the string, or the current date if parsing fails.
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) ?? Date()
    }
    
    /// Converts a string to another string representing a date formatted using a specified format.
    ///
    /// - Parameters:
    ///   - formatDate: The date format of the original string. Default value is "yyyy-MM-dd'T'HH:mm:ss.SSSZ".
    ///   - formatString: The desired date format for the resulting string. Default value is "yyyy-MM-dd'T'HH:mm:ss.SSSZ".
    /// - Returns: A string representing the date formatted using the specified format.
    func toDate(formatDate: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", formatString: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
        self.toDate(format: formatDate).toString(format: formatString)
    }
}

/// An extension of Date providing utility methods for converting to and from String.
extension Date {
    /// Converts a Date object to a string using a specified date format.
    ///
    /// - Parameter format: The date format to use for formatting the date. Default value is "yyyy-MM-dd'T'HH:mm:ss.SSSZ".
    /// - Returns: A string representation of the date formatted using the specified format.
    func toString(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

