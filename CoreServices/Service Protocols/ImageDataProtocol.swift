//
//  ImageDataProtocol.swift
//  CoreServices
//
//  Created by Chandana Sudha Madhuri Kandari on 27/04/24.
//

import Foundation

public protocol ImageDataProtocol: AnyObject {
    func saveImageData(data: [ImageDataResult]) throws -> Bool 
    func fetchImageData()throws -> [ImageDataResult]?
    
    func getDataResponse() -> [ImageDataResult]?
}
