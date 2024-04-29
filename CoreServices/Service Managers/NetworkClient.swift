//
//  NetworkClient.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import Foundation

public class NetworkClient: NetworkProtocol {
    
    public init() {}
    
    public func load<T: Codable>(resource: String) -> T {
        guard let file = Bundle.main.url(forResource: resource, withExtension: "json") else {
            fatalError("Couldn't find \(resource) in main bundle.")
        }
        let data: Data
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(resource) from main bundle:\n\(error)")
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(resource) as \(T.self):\n\(error)")
        }
    }
}
