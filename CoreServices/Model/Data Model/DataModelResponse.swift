////
////  DataModel.swift
////  CoreDataOffline
////
////  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
////
//
import Foundation

public struct DataModelResponse: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let docs: [Doc]
}

// MARK: - Doc
struct Doc: Codable {
    let abstract: String
    let multimedia: [Multimedia]
    let headline: Headline
    let pubDate: String

    enum CodingKeys: String, CodingKey {
        case abstract
        case multimedia, headline
        case pubDate = "pub_date"
    }
}


// MARK: - Headline
struct Headline: Codable {
    let main: String
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let url: String
}
