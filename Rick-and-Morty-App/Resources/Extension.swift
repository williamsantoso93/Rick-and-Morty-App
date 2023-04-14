//
//  Extension.swift
//  Rick-and-Morty-App
//
//  Created by William Santoso on 14/04/23.
//

import Foundation

extension String {
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) ?? Date()
    }
    
    func toDate(formatDate: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", formatString: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
        self.toDate(format: formatDate).toString(format: formatString)
    }
}

extension Date {
    func toString(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
