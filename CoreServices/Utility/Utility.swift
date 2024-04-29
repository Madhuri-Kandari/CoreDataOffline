//
//  File.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//

import Foundation

public class Utility {
    public static func getDate(date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        guard let result = dateFormatter.date(from: date) else { return Date() }
        return result
    }
    
    public static func dateToString(date: Date) -> String? {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }
}
