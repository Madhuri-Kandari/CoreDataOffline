//
//  CoreDataSource.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 26/04/24.
//

import Foundation

public protocol CoreDataSource: AnyObject {
    func saveData(data: [ImageDataResult]) throws -> Bool
    func fetchData() throws -> [ImageDataResult]?
}
