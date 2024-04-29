//
//  NetworkProtocol.swift
//  CoreDataOffline
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import Foundation

public protocol NetworkProtocol: AnyObject {
    
    func load<T: Codable>(resource: String) -> T
    
}
