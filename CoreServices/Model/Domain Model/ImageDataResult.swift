//
//  ImageDataResult.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//

import Foundation

public struct ImageDataResult: Codable {
    public var description: String = ""
    public var multimedia: String = ""
    public var headline: String = ""
    public var date: Date = Date()
    
    public init(abstract: String, multimedia: String, headline: String, date: Date) {
        self.description = abstract
        self.multimedia = multimedia
        self.headline = headline
        self.date = date
    }
}

extension ImageDataResult {
    init(doc: Doc) {
        self.description = doc.abstract
        self.date = Utility.getDate(date: doc.pubDate)
        self.headline = doc.headline.main
        self.multimedia = doc.multimedia.first?.url ?? ""
    }
}

